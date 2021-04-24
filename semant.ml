(*
Date        Author        Changes
2021-03-22  Andreas       Add basic parts based on MicroC to make hello world works
2021-03-22  Andreas       Add TODOs for further development
*)

open Ast
open Sast

module StringMap = Map.Make(String)

(* Semantic checking of the AST. Returns an SAST if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

   let check (globals, functions) =

    let check_binds (kind : string) (to_check : bind list) = 
      let check_it checked binding = 
        let void_err = "illegal void " ^ kind ^ " " ^ snd binding
        and dup_err = "duplicate " ^ kind ^ " " ^ snd binding
        in match binding with
          (* No void bindings *)
          (Void, _) -> raise (Failure void_err)
        | (_, n1) -> match checked with
                      (* No duplicate bindings *)
                        ((_, n2) :: _) when n1 = n2 -> raise (Failure dup_err)
                      | _ -> binding :: checked
      in let _ = List.fold_left check_it [] (List.sort compare to_check) 
          in to_check 
    in 
  
    let check_globals (kind : string) (to_check : global list) = 
  
      let check_it (checked, global_map) (binding, ex) = 
        let void_err = "illegal void " ^ kind ^ " " ^ snd binding
        and dup_err = "duplicate " ^ kind ^ " " ^ snd binding
  
      in
  
      let check_identifier_assign s = 
          if StringMap.mem s global_map then
            let (_, t2) = StringMap.find s global_map in
            if t2 = Void then raise (Failure ("uninialized identifier " ^ s))
            else t2
          else raise (Failure ("undeclared identifier " ^ s))
      in
  
      (* Return a semantically-checked expression, i.e., with a type *)
      let rec expr = function
      IntLit l -> (Int, SIntLit l)
    | DoubleLit l -> (Double, SDoubleLit l)
    | BoolLit l  -> (Bool, SBoolLit l)
    | Noexpr     -> (Void, SNoexpr)
    | CharLit l -> (Char, SCharLit l)
    | StringLit l -> (String, SStringLit l)
    (* TODO: CHECK MATRIX LITERAL IN GLOBAL*)
    | Unop(op, e) as ex -> 
        let (t, e') = expr e in
        let ty = match op with
          Neg when t = Int || t = Double -> t
        | Not when t = Bool -> Bool
        | _ -> raise (Failure ("illegal unary operator " ^ 
                               string_of_uop op ^ string_of_data_type t ^
                               " in " ^ string_of_expr ex))
        in (ty, SUnop(op, (t, e')))
    | Binop(e1, op, e2) as e -> 
        let (t1, e1') = expr e1 
        and (t2, e2') = expr e2 in
        let same = t1 = t2 in
        (* Determine expression type based on operator and operand types *)
        let ty = match op with
            Add | Sub | Mult | Div when same && t1 = Int   -> Int
          | Add | Sub | Mult | Div when same && t1 = Double -> Double
          | Equal | Neq            when same               -> Bool
          | Less | Leq | Greater | Geq
                    when same && (t1 = Int || t1 = Double) -> Bool
          | And | Or when same && t1 = Bool -> Bool
          | Add | Sub  | Mult when same && t1 = Matrix -> Matrix
          | Mult when t1 = Int && t2 = Matrix -> Matrix
          | Mult when t1 = Double && t2 = Matrix -> Matrix
          | Dot when same && t1 = Matrix -> Double
          | Div when t1 = Matrix && t2 = Int -> Matrix
          | Div when t1 = Matrix && t2 = Double -> Matrix
          | _ -> raise (
                    Failure ("illegal binary operator " ^
                                  string_of_data_type t1 ^ " " ^ string_of_operator op ^ " " ^
                                  string_of_data_type t2 ^ " in " ^ string_of_expr e))
                      in (ty, SBinop((t1, e1'), op, (t2, e2')))

    | _ -> raise (Failure ("illegal operation for global initialization"))
        in
        
        let (tx, ex') = expr ex
  
        in match (binding, ex) with
          (* No void bindings *)
          ((Void, _), _) -> raise (Failure void_err)
        | ((t1, n1), _) -> if StringMap.mem n1 global_map then raise (Failure dup_err) else
                          let global_map = StringMap.add (snd binding) ((fst binding), tx) global_map in
                          if tx = t1 || tx = Void then (((binding, (tx, ex')) :: checked), global_map)
                        else raise (Failure ("unmatch types " ^ string_of_data_type t1 ^ " and " ^ string_of_data_type tx))
  
      in let _ = List.fold_left check_it ([], StringMap.empty) to_check
         in to_check
    in 
  
    (**** Checking Global Variables ****)
    let globals' = check_globals "global" globals in
    let glob =
        let extract (fst, _) = fst 
        in List.map extract globals' 
    in
  
    (**** Check functions ****)
  
    (* Collect function declarations for built-in functions: no bodies *)
    let built_in_decls = 
      let add_bind map (name, ty,ret) = StringMap.add name {
        data_type = Void;
        fname = name; 
        formals =
      (let rec create_ty_list = (function
        [] -> []
        | hd::tl -> (hd, "x")::(create_ty_list tl))
        in create_ty_list ty);
        locals = []; body = [] } map
      in List.fold_left add_bind StringMap.empty [ ("print", [Int],Void);
                                 ("printb", [Bool],Void);
                                 ("printd", [Double],Void);
                                 ("printm", [Matrix],Void);
                                 ("printStr", [String],Void);
                                 ("matrxAdd", [Matrix; Matrix], Matrix);
                                 ("transpose", [Matrix], Matrix);
                                 ("det", [Matrix], Double);
                                 ("inv", [Matrix], Matrix);
                                 ("rref", [Matrix], Matrix);
                                 ("isInv", [Matrix], Bool); 
                                 ("accessMatrix",[Matrix;Int;Int],Double);
                                 ("accessMatrix1D",[Matrix;Int],Matrix);
                                 ("accessMatrixCol",[Matrix;Int],Matrix);
                                 ("print_diagonal",[Matrix],Matrix);]
    in
  
    (* Add function name to symbol table *)
    let add_func map fd = 
      let built_in_err = "function " ^ fd.fname ^ " may not be defined"
      and dup_err = "duplicate function " ^ fd.fname
      and make_err er = raise (Failure er)
      and n = fd.fname (* Name of the function *)
      in match fd with (* No duplicate functions or redefinitions of built-ins *)
           _ when StringMap.mem n built_in_decls -> make_err built_in_err
         | _ when StringMap.mem n map -> make_err dup_err  
         | _ ->  StringMap.add n fd map 
    in
  
    (* Collect all function names into one symbol table *)
    let function_decls = List.fold_left add_func built_in_decls functions
    in
    
    (* Return a function from our symbol table *)
    let find_func s = 
      try StringMap.find s function_decls
      with Not_found -> raise (Failure ("unrecognized function " ^ s))
    in
  
    let _ = find_func "main" in (* Ensure "main" is defined *)
  
    let check_function func =
      (* Make sure no formals are void or duplicates *)
      let formals' = check_binds "formal" func.formals in
      (* Raise an exception if the given rvalue type cannot be assigned to
         the given lvalue type *)
      let check_assign lvaluet rvaluet err =
        if lvaluet = rvaluet then lvaluet else raise (Failure err)
      in    

    let rec find_locals stmt_list locals= match stmt_list with
      | Vdecl (b, _):: tl -> b :: (find_locals tl locals)
      | Block sl :: tl -> 
        let rec find_locals_in_block sl locals= match sl with
              | Block sl :: tl  -> find_locals_in_block (sl @ tl) locals(* Flatten blocks *)
              | Vdecl(b, _) :: tl  -> (b :: (find_locals tl locals))
              | _ ::tl       -> find_locals_in_block tl locals
              | [] -> locals
              in (find_locals_in_block sl locals) @ (find_locals tl locals)
      | If(_,_,e) :: tl -> (find_locals [e] locals) @ (find_locals tl locals)
      | For(_,_,_,e) ::tl -> (find_locals [e] locals) @ (find_locals tl locals)
      | While(_,e) :: tl -> (find_locals [e] locals) @ (find_locals tl locals)
      | _ :: tl-> find_locals tl locals
      | [] -> locals
      in

    let locals = find_locals func.body [] in
    let locals' = check_binds "local" locals in
    let symbol = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
                    StringMap.empty (glob @ formals') in
      let symbols = [symbol] in
    let type_of_identifier s symbols =  
      (* try StringMap.find s (List.hd symbols) with Not_found -> raise (Failure ("undeclared identifier " ^ s)) *)
      let rec f list = match list with 
        [] -> raise (Failure ("undeclared identifier " ^ s))
      | fst :: tail -> try StringMap.find s fst with Not_found -> f tail 
    in f symbols 
    in
    

      let rec get_dims = function
      MatrixLit l -> List.length l :: get_dims (List.hd l)
    | _ -> []
      in

      let rec flatten d = function
      [] -> []
      | MatrixLit hd::tl -> if List.length hd != List.hd d then raise (Failure("Invalid dims")) else List.append (flatten (List.tl d) hd) (flatten d tl)
      | a -> a
      in
  
      (* Return a semantically-checked expression, i.e., with a type *)
      let rec expr e symbols = match e with
          IntLit l -> (Int, SIntLit l)
        | DoubleLit l -> (Double, SDoubleLit l)
        | BoolLit l  -> (Bool, SBoolLit l)
        | Noexpr     -> (Void, SNoexpr)
        | Noassign     -> (Void, SNoassign)
        | CharLit l ->(Char, SCharLit l)        (* TODO: review *)
        | StringLit l ->(String, SStringLit l)  (* TODO: review *)
        | MatrixLit l -> 
          let d = get_dims (MatrixLit l) in
          let rec all_match = function
            [] -> ignore()
            | hd::tl -> if tl != [] then
                          let (t1, _) = expr hd symbols in let (t2, _) = expr (List.hd tl) symbols in
                          if t1 = t2 then all_match tl else raise (Failure ("Data Mismatch in MatrixLit: " ^ string_of_data_type t1 ^ " does not match " ^ string_of_data_type t2))
                        else ignore()
          in
          all_match l;
          let expr_mapper e = expr e symbols in
          if List.length d > 2 then (Matrix, SMatrixLit( (List.map expr_mapper l ), List.hd d, List.hd (List.tl d) ) )
          else if List.length d = 2 then (Matrix, SMatrixLit ( (List.map expr_mapper (flatten (List.tl d) l)), List.hd d, List.hd (List.tl d)))
          else if List.length d = 1 then (Matrix, SMatrixLit ( (List.map expr_mapper (flatten (List.tl d) l)), List.hd d, 1))
          else (Matrix, SMatrixLit ( (List.map expr_mapper l ), 0,0))
        | MatrixAccess(s,e1,e2)->let s_type=type_of_identifier s symbols in 
          (Matrix, SMatrixAccess(s, expr e1 symbols, expr e2 symbols))

        | MatrixAccess1D(s,e1)->let s_type=type_of_identifier s symbols in 
          (Matrix, SMatrixAccess1D(s, expr e1 symbols))
        | MatrixAccessCol(s,e1)->let s_type=type_of_identifier s symbols in 
          (Matrix, SMatrixAccessCol(s, expr e1 symbols))

        | MatrixPower(s,e1)->let s_type=type_of_identifier s symbols in 
          (Matrix, SMatrixPower(s, expr e1 symbols))

        | Id s       -> (type_of_identifier s symbols, SId s)
        | Assign(var, e) as ex -> 
            let lt = type_of_identifier var symbols
            and (rt, e') = expr e symbols in
            let err = "illegal assignment " ^ string_of_data_type lt ^ " = " ^ 
              string_of_data_type rt ^ " in " ^ string_of_expr ex
            in (check_assign lt rt err, SAssign(var, (rt, e')))
        | Unop(op, e) as ex -> 
            let (t, e') = expr e symbols in
            let ty = match op with
              Neg when t = Int || t = Double -> t
            | Not when t = Bool -> Bool
            | _ -> raise (Failure ("illegal unary operator " ^ 
                                   string_of_uop op ^ string_of_data_type t ^
                                   " in " ^ string_of_expr ex))
            in (ty, SUnop(op, (t, e')))
        | Binop(e1, op, e2) as e -> 
            let (t1, e1') = expr e1 symbols
            and (t2, e2') = expr e2 symbols in
            let same = t1 = t2 in
            (* Determine expression type based on operator and operand types *)
            let ty = match op with
              Add | Sub | Mult | Div when same && t1 = Int   -> Int
            | Add | Sub | Mult | Div when same && t1 = Double -> Double
            | Equal | Neq            when same               -> Bool
            | Less | Leq | Greater | Geq
                       when same && (t1 = Int || t1 = Double) -> Bool
            | And | Or when same && t1 = Bool -> Bool
            | Add | Sub  | Mult when same && t1 = Matrix -> Matrix
            | Mult when t1 = Int && t2 = Matrix -> Matrix
            | Mult when t1 = Double && t2 = Matrix -> Matrix
            | Dot when same && t1 = Matrix -> Double
            | Div when t1 = Matrix && t2 = Int -> Matrix
            | Div when t1 = Matrix && t2 = Double -> Matrix
            | _ -> raise (
          Failure ("illegal binary operator " ^
                         string_of_data_type t1 ^ " " ^ string_of_operator op ^ " " ^
                         string_of_data_type t2 ^ " in " ^ string_of_expr e))
            in (ty, SBinop((t1, e1'), op, (t2, e2')))
        | Call(fname, args) as call -> 
            let fd = find_func fname in
            let param_length = List.length fd.formals in
            if List.length args != param_length then
              raise (Failure ("expecting " ^ string_of_int param_length ^ 
                              " arguments in " ^ string_of_expr call))
            else let check_call (ft, _) e = 
              let (et, e') = expr e symbols in 
              let err = "illegal argument found " ^ string_of_data_type et ^
                " expected " ^ string_of_data_type ft ^ " in " ^ string_of_expr e
              in (check_assign ft et err, e')
            in 
            let args' = List.map2 check_call fd.formals args
            in (fd.data_type, SCall(fname, args'))
      in
  
      let check_bool_expr e symbols = 
        let (t', e') = expr e symbols
        and err = "expected Boolean expression in " ^ string_of_expr e
        in if t' != Bool then raise (Failure err) else (t', e') 
      in
  
      (* Return a semantically-checked statement i.e. containing sexprs *)
      let rec check_stmt e symbols = match e with
          Expr e -> (SExpr (expr e symbols), symbols)
        | If(p, b1, b2) -> SIf(check_bool_expr p symbols, fst(check_stmt b1 symbols), fst(check_stmt b2 symbols)), symbols
        | For(e1, e2, e3, st) ->
          SFor(expr e1 symbols, check_bool_expr e2 symbols, expr e3 symbols, fst(check_stmt st symbols)), symbols
        | While(p, s) -> SWhile(check_bool_expr p symbols, fst(check_stmt s symbols)), symbols
        | Return e -> let (t, e') = expr e symbols in
        if t = func.data_type then SReturn (t, e'), symbols
        else raise (
	      Failure ("return gives " ^ string_of_data_type t ^ " expected " ^
		   string_of_data_type func.data_type ^ " in " ^ string_of_expr e))
        
        (* A block is correct if each statement is correct and nothing
           follows any Return statement.  Nested blocks are flattened. *)
        | Block sl -> 
            let rec check_stmt_list e symbols = match e with
                [Return _ as s] -> [check_stmt s symbols]
              | Return _ :: _   -> raise (Failure "nothing may follow a return")
              | Block sl :: ss  -> check_stmt_list (sl @ ss) symbols (* Flatten blocks *)
              | s :: ss         -> let (a,b) = check_stmt s symbols in (a,b) :: (check_stmt_list ss b)
              | []              -> []
          in let symbols_up = StringMap.empty :: symbols in (SBlock(List.map fst (check_stmt_list sl symbols_up)), symbols)
        | Vdecl (b, e) -> 
          let (te', _) = expr e symbols in 
            if (fst b) != te' && te' != Void then raise (Failure ("illegal assignment " ^ string_of_data_type (fst b)  ^ " = " ^ 
            string_of_data_type te'))
          else
            let entry = StringMap.add (snd b) (fst b) (List.hd symbols) in let symbols_up = 
            match symbols with
              [_] -> [entry]
            | _ :: tl -> entry :: tl
            | _ -> raise (Failure ("wrong symbol table")) in
                    let k = (SVdecl ((type_of_identifier (snd b) symbols_up, snd b), expr e symbols_up), symbols_up)
                      in k
  
      in (* body of check_function *)
      { sdata_type = func.data_type;
        sfname = func.fname;
        sformals = formals';
        slocals  = locals';
        sbody = match fst (check_stmt (Block func.body) symbols) with
    SBlock(sl) -> sl
        | _ -> raise (Failure ("internal error: block didn't become a block?"))
      }
    in (glob, List.map check_function functions)
  