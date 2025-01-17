(* Authors: Matcat Team *)

open Ast

type sexpr = data_type * sx
and sx =
    SIntLit of int
  | SBinop of sexpr * operator * sexpr
  | SUnop of unary_operator * sexpr
  | SDoubleLit of string
  | SStringLit of string
  | SBoolLit of bool
  | SMatrixLit of sexpr list * int * int 
  | SId of string
  | SAssign of string * sexpr
  | SCall of string * sexpr list
  | SMatrixAccess of string * sexpr * sexpr
  | SMatrixAccess1D of string * sexpr
  | SMatrixAccessCol of string * sexpr
  | SMatrixDiagonal of string
  | SMatrixPower of string * sexpr
  | SNoexpr
  | SNoassign

type sstmt =
    SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SFor of sexpr * sexpr * sexpr * sstmt
  | SWhile of sexpr * sstmt
  | SVdecl of bind * sexpr

type sfunc_decl = {
    sfname : string;
    sformals : bind list;
	  sdata_type : data_type;
    slocals : bind list;
    sbody : sstmt list;
  }

type sprogram = global list * sfunc_decl list


(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_data_type t ^ " : " ^ (match e with
      SIntLit(l) -> string_of_int l
    | SBinop(e1, o, e2) ->
        string_of_sexpr e1 ^ " " ^ string_of_operator o ^ " " ^ string_of_sexpr e2
    | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
    | SDoubleLit(l) -> l
    | SStringLit(l) -> l
    | SBoolLit(true) -> "true"
    | SBoolLit(false) -> "false"
    | SMatrixLit(l, r, c) -> "rows: " ^ string_of_int r ^ ", cols: " ^ 
                  string_of_int c ^ " : [" ^ String.concat ", " (List.map string_of_sexpr l) ^ "]"
    | SId(s) -> s
    | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
    | SMatrixAccess(s,e1,e2)-> "SMatrixAccess " ^ s ^ "[" ^ string_of_sexpr(e1) ^ "]" ^ "[" ^ string_of_sexpr(e2) ^ "]"
    | SMatrixAccess1D(s,e1)-> "SMatrixAccess1D " ^ s ^ "[" ^ string_of_sexpr(e1) ^ ",:]"
    | SMatrixAccessCol(s,e1)-> "SMatrixAccessCol " ^ s ^ "[:," ^ string_of_sexpr(e1) ^ "]"
    | SMatrixDiagonal(s)-> "MatrixDiagonal " ^ s ^ "[:, :]"
    | SMatrixPower(s,e1) -> "SMatrixPower " ^ s ^"^" ^ string_of_sexpr(e1)
    | SCall(f, el) ->
        f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
    | SNoexpr -> ""
    | SNoassign -> ""
  )
  ^ ")"		

let rec string_of_sstmt = function
    SBlock(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "}\n"
  | SExpr(expr) -> string_of_sexpr expr ^ ";\n";
  | SReturn(expr) -> "return " ^ string_of_sexpr expr ^ ";\n";
  | SIf(e, s, SBlock([])) -> "if (" ^ string_of_sexpr e ^ ")\n" ^ string_of_sstmt s
  | SIf(e, s1, s2) ->  "if (" ^ string_of_sexpr e ^ ")\n" ^
    string_of_sstmt s1 ^ "else\n" ^ string_of_sstmt s2
  | SFor(e1, e2, e3, s) ->
    "for (" ^ string_of_sexpr e1  ^ " ; " ^ string_of_sexpr e2 ^ " ; " ^
    string_of_sexpr e3  ^ ") " ^ string_of_sstmt s
  | SWhile(e, s) -> "while (" ^ string_of_sexpr e ^ ") " ^ string_of_sstmt s
  | SVdecl(b, e) -> 
    if string_of_sexpr e = "" then
        string_of_data_type (fst b) ^ " " ^ (snd b) ^ ";\n" 
    else string_of_data_type (fst b) ^ " " ^ (snd b) ^" = "^ string_of_sexpr e ^ ";\n"



    let string_of_sfdecl fdecl =
      "func " ^
      fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
      ")" ^ string_of_data_type fdecl.sdata_type ^ "\n{\n" ^
      String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
      "}\n"    

let string_of_sprogram (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs)
  