(*this codegen file is ONLY intended for printing "hello world". To be able to debug and easily manipulate the code,
I have removed part of the code that is not involved in printing "hello world" *)

module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in
  let llmem = L.MemoryBuffer.of_file "matrixLibrary.bc" in
  let llm = Llvm_bitreader.parse_bitcode context llmem in


  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "MatCat" in

  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and double_t    = L.double_type context
  and void_t     = L.void_type   context
  and matrx_t    = L.pointer_type (match L.type_by_name llm "struct.matrix" with
      None -> raise (Failure "Missing implementation for struct Matrix")
    | Some t -> t)
  in
  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
    | A.String -> L.pointer_type (L.array_type i8_t 100)
    | A.Void  -> void_t
    | A.Int   -> i32_t
    | A.Bool  -> i1_t
    | A.Double -> double_t
    | A.Matrix -> matrx_t
  in

  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n, _) =
      let init = match t with
          A.Double-> L.const_float (ltype_of_typ t) 0.0
        | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  let printf_t : L.lltype =
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue =
      L.declare_function "printf" printf_t the_module in


      let printMatrix_t = L.function_type i32_t [| matrx_t |] in
      let printMatrix_f = L.declare_function "printMatrix" printMatrix_t the_module in

      let matrix_init_t = L.function_type matrx_t [|i32_t ; i32_t|] in
      let matrix_init_f = L.declare_function "initMatrix_helper" matrix_init_t the_module in

      let store_matrix_t = L.function_type matrx_t [|matrx_t ; i32_t |] in
      let store_matrix_f = L.declare_function "storeEntries" store_matrix_t the_module in

      let add_matrix_t = L.function_type matrx_t [|matrx_t; matrx_t|] in
      let add_matrix_f = L.declare_function "matrxAdd" add_matrix_t the_module in


  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types = 
	Array.of_list (List.map (fun (t,_,_) -> ltype_of_typ t) fdecl.sformals)
      (* Returning mutiple values  *)
      in let ftype = L.function_type (ltype_of_typ (List.hd fdecl.sdata_type)) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder
    and float_format_str = L.build_global_stringptr "%g\n" "fmt" builder 
    and string_format_str = L.build_global_stringptr "%s\n" "fmt" builder
    and double_format_str = L.build_global_stringptr "%g\n" "fmt" builder
    and matrix_format_str = L.build_global_stringptr "%g " "fmt" builder
    and return_format_str = L.build_global_stringptr "\n" "fmt" builder in

    let local_vars =
      let add_formal m (t, n) p =
        L.set_value_name n p;
	let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
	StringMap.add n local m

      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      and add_local m (t, n) =
  let local_var = L.build_alloca (ltype_of_typ t) n builder
	in StringMap.add n local_var m
      in

      let sformals = List.map (fun (tp, vName, _) -> (tp, vName)) fdecl.sformals in
      let slocals= List.map (fun (tp, vName, _) -> (tp, vName)) fdecl.slocals in
      let formals = List.fold_left2 add_formal StringMap.empty sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals slocals
    in


    let lookup n = try StringMap.find n local_vars
    with Not_found -> StringMap.find n global_vars
    in

    let is_matrix ptr = 
      let ltype_string = L.string_of_lltype (L.type_of ptr) in
      match ltype_string with
        "%matrix_t*" -> true
      | _ -> false
    in

    let rec expr builder ((_, e) : sexpr) = match e with
	      SIntLit i  -> L.const_int i32_t i
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SDoubleLit l -> L.const_float_of_string double_t l
      | SCharLit l  -> L.const_int i8_t (int_of_char l)
      | SStringLit s -> L.build_global_stringptr s "tmp" builder
      | SId s       -> L.build_load (lookup s) s builder
      | SMatrixLit (contents, rows, cols) ->
        let rec expr_list = function
          [] -> []
          | hd::tl -> expr builder hd::expr_list tl
        in
        let contents' = expr_list contents
        in
        let m = L.build_call matrix_init_f [| L.const_int i32_t cols; L.const_int i32_t rows |] "matrix_init" builder
        in
        ignore(List.map (fun v -> L.build_call store_matrix_f [| m ; v |] "store_val" builder) contents'); m
      | SNoexpr     -> L.const_int i32_t 0
      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      | SBinop (e1, op, e2) ->
       (let c1 = expr builder e1 in
        let c2 = expr builder e2 in

        let check1 = is_matrix c1 in
        let check2 = is_matrix c2 in
        match (check1,check2) with
        | (false,false) ->

	      let e1' = expr builder e1
	      and e2' = expr builder e2 in
        (match op with
          A.Add     -> L.build_add
        | A.Sub     -> L.build_sub
        | A.Mult    -> L.build_mul
        | A.Div     -> L.build_sdiv
        | A.And     -> L.build_and
        | A.Or      -> L.build_or
        | A.Equal   -> L.build_icmp L.Icmp.Eq
        | A.Neq     -> L.build_icmp L.Icmp.Ne
        | A.Less    -> L.build_icmp L.Icmp.Slt
        | A.Leq     -> L.build_icmp L.Icmp.Sle
        | A.Greater -> L.build_icmp L.Icmp.Sgt
        | A.Geq     -> L.build_icmp L.Icmp.Sge
	      ) e1' e2' "tmp" builder
        | _ -> 
         let e1' = expr builder e1
	      and e2' = expr builder e2 in
        (match op with
          A.Add     -> L.build_add
        | A.Sub     -> L.build_sub
        | A.Mult    -> L.build_mul
        | A.Div     -> L.build_sdiv
        | A.And     -> L.build_and
        | A.Or      -> L.build_or
        | A.Equal   -> L.build_icmp L.Icmp.Eq
        | A.Neq     -> L.build_icmp L.Icmp.Ne
        | A.Less    -> L.build_icmp L.Icmp.Slt
        | A.Leq     -> L.build_icmp L.Icmp.Sle
        | A.Greater -> L.build_icmp L.Icmp.Sgt
        | A.Geq     -> L.build_icmp L.Icmp.Sge
	      ) e1' e2' "tmp" builder
        | (true,true) ->
          let e1' = expr builder e1 and e2' = expr builder e2 in
          (match op with
              A.Add -> L.build_call add_matrix_f [| (expr builder e1); (expr builder e2) |] "matrxAdd" builder
            | A.Sub -> L.build_call add_matrix_f [| (expr builder e1); (expr builder e2) |] "matrxAdd" builder
          )
        )
        | SUnop(op, ((t, _) as e)) ->
          let e' = expr builder e in
	        (match op with
	        A.Neg when t = A.Double -> L.build_fneg
	      | A.Neg                  -> L.build_neg
        | A.Not                  -> L.build_not) e' "tmp" builder
        | SCall ("print", [e]) | SCall ("printb", [e]) ->
          L.build_call printf_func [| int_format_str ; (expr builder e) |] 
          "printf" builder    

        | SCall ("printStr", [e]) ->
          L.build_call printf_func [| string_format_str ; (expr builder e) |]
          "printf" builder

        | SCall ("printd",[e]) ->
          L.build_call printf_func [| float_format_str ; (expr builder e) |]
          "printf" builder

        | SCall ("printm", [e]) ->
          L.build_call printMatrix_f [| (expr builder e) |] "printm" builder

        | SCall (f, args) ->
          let (fdef, fdecl) = StringMap.find f function_decls in
	    let llargs = List.rev (List.map (expr builder) (List.rev args)) in
	    let result = (match (List.hd fdecl.sdata_type) with (* TODO: figure out how to return more than 1 value *)
                        A.Void -> ""
                      | _ -> f ^ "_result") in
      L.build_call fdef (Array.of_list llargs) result builder
    in
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
	      Some _ -> ()
      | None -> ignore (instr builder) in
	
    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)

       let rec stmt builder m = function
       SBlock sl ->                       
                   let helper (bldr, map) = stmt bldr map in
                   let (b, _) = List.fold_left helper (builder, m) sl in
                   (b, m)
           | SExpr e -> ignore(expr builder e); (builder, m)
           | SReturn e -> ignore(match List.hd fdecl.sdata_type with
                                   (* Special "return nothing" instr *)
                                   A.Void -> L.build_ret_void builder
                                   (* Build return statement *)
                                 | _ -> L.build_ret (expr builder e) builder );
                          (builder, m)
           | SIf (predicate, then_stmt, else_stmt) ->
              let bool_val = expr builder predicate in
        let merge_bb = L.append_block context "merge" the_function in
              let build_br_merge = L.build_br merge_bb in (* partial function *)
     
        let then_bb = L.append_block context "then" the_function in
        let (b', _) = stmt (L.builder_at_end context then_bb) m then_stmt in
        add_terminal b'
        build_br_merge;
     
        let else_bb = L.append_block context "else" the_function in
        let (b', _) = stmt (L.builder_at_end context else_bb) m else_stmt in
        add_terminal b'
          build_br_merge;
     
        ignore(L.build_cond_br bool_val then_bb else_bb builder);
        (L.builder_at_end context merge_bb, m)
     
           | SWhile (predicate, body) ->
         let pred_bb = L.append_block context "while" the_function in
         ignore(L.build_br pred_bb builder);
     
         let body_bb = L.append_block context "while_body" the_function in
         let (b', _) = stmt (L.builder_at_end context body_bb) m body in
         add_terminal b'
           (L.build_br pred_bb);
     
         let pred_builder = L.builder_at_end context pred_bb in
         let bool_val = expr pred_builder predicate in
     
         let merge_bb = L.append_block context "merge" the_function in
         ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
         (L.builder_at_end context merge_bb, m)

         
     
           (* Implement for loops as while loops *)
           | SFor (e1, e2, e3, body) -> stmt builder m
           ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
         in
     
         (* Build the code for each statement in the function *)
         let (builder, _) = stmt builder local_vars (SBlock fdecl.sbody) in
     
         (* Add a return if the last block falls off the end *)
         add_terminal builder (match List.hd fdecl.sdata_type with
             A.Void -> L.build_ret_void
           | A.Double -> L.build_ret (L.const_float double_t 0.0)
           | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
       in
     
       List.iter build_function_body functions;
       the_module
     