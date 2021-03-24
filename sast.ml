(*
Date        Author        Changes
2021-03-22  Andreas       Add basic parts based on MicroC to make hello world works
2021-03-22  Andreas       Add TODOs for further development
*)

open Ast

type sexpr = data_type * sx
and sx =
    SLiteral of int
  | SBinop of sexpr * operator * sexpr
  | SUnop of unary_operator * sexpr
  | SDoubleliteral of string
  | SStringLit of string
  | SBoolLit of bool
  | SCharLit of char
  | SMatrixLit of float array array
  | SId of string
  | SAssign of string * sexpr
  | SCall of string * sexpr list
  | SNoexpr

type sstmt =
    SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SFor of sexpr * sexpr * sexpr * sstmt
  | SWhile of sexpr * sstmt

type sfunc_decl = {
    sfname : string;
    sformals : bind list;
	  sdata_types : data_type list;
    slocals : bind list;
    sbody : sstmt list;
  }

type sprogram = bind list * sfunc_decl list


(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_data_type t ^ " : " ^ (match e with
      SLiteral(l) -> string_of_int l
    | SBinop(e1, o, e2) ->
        string_of_sexpr e1 ^ " " ^ string_of_operator o ^ " " ^ string_of_sexpr e2
    | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
    | SDoubleliteral(l) -> l
    | SStringLit(l) -> l
    | SBoolLit(true) -> "true"
    | SBoolLit(false) -> "false"
    | SCharLit(l) -> "???"
    | SMatrixLit(l) -> "???"
    | SId(s) -> s
    | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
    | SCall(f, el) ->
        f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
    | SNoexpr -> ""
            ) ^ ")"		

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

let string_of_sfdecl fdecl =
  "func " ^
  String.concat "" (List.map string_of_data_type fdecl.sdata_types) ^
  fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.slocals) ^
  String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
  "}\n"

let string_of_sprogram (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs)
  