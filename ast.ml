(*
Author: Matcat team
Copyright 2021, Matcat
*)

type operator = Add | Sub | Mult | Div | Equal
              | Neq | Less | Leq | Greater 
              | Geq | And | Or | Cr | Dot 

type unary_operator = Not | Neg | Inverse | Transpose

type data_type = Int | Char | Double | String | Void | Bool | Matrix | Vector

type expr =
  IntLit of int
| Binop of expr * operator * expr
| Unop of unary_operator * expr
| DoubleLit of string
| StringLit of string
| BoolLit of bool
| CharLit of char
| MatrixLit of float array array
| Id of string
| Assign of string * expr
| Call of string * expr list
| Noexpr

type bind = data_type * string

type stmt =
  Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
(*our func lists return types before body of the funct
Also not sure where to include Funct keyword- I figured it out :) *)

type func_decl = {
    fname : string;
    formals : bind list;
	  data_type : data_type;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list


let string_of_operator = function
  Add -> "+"
| Sub -> "-"
| Mult -> "*"
| Div -> "/"
| Equal -> "=="
| Neq -> "!="
| Less -> "<"
| Leq -> "<="
| Greater -> ">"
| Geq -> ">="
| And -> "&&"
| Or -> "||"
| Cr -> "cr"
| Dot -> "dot"

let string_of_uop = function
  Neg -> "-"
| Not -> "!"
| Transpose -> "Transpose"
| Inverse -> "Inverse"

let string_of_data_type = function
  Int -> "int"
| Bool -> "bool"
| Double -> "double"
| String -> "string"
| Char -> "char"
| Matrix -> "matrix"
| Vector -> "vector"
| Void -> "void"

(* Pretty-printing functions *)

let rec string_of_expr = function
  IntLit (l) -> string_of_int l
| Binop(e1, o, e2) ->
  string_of_expr e1 ^ " " ^ string_of_operator o ^ " " ^ string_of_expr e2
| Unop(o, e) -> string_of_uop o ^ string_of_expr e
| DoubleLit(l) -> l
| StringLit(l) -> l
| BoolLit(true) -> "true"   
| BoolLit(false) -> "false"
| CharLit(_) -> "???"     (* TODO: implement/remove it  *)
| MatrixLit(_) -> "???"   (* TODO: implement/remove it  *)
| Id(s) -> s
| Assign(v, e) -> v ^ " = " ^ string_of_expr e
| Call(f, el) ->
    f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
| Noexpr -> ""

let rec string_of_stmt = function
  Block(stmts) ->
    "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
| Expr(expr) -> string_of_expr expr ^ ";\n";
| Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
| If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
| If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
  string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
| For(e1, e2, e3, s) ->
  "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
  string_of_expr e3  ^ ") " ^ string_of_stmt s
| While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

  (*variable declaration*)
let string_of_vdecl (t, id) = string_of_data_type t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  "func " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ") " ^
  string_of_data_type fdecl.data_type ^
  "{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n" 

  (*
  let string_of_fdecl fdecl =
    "func " ^
    fdecl.fname ^ "(" ^ String.concat ", " (List.map (fun (_, vName, _) -> vName) fdecl.formals) ^
    ")" ^ String.concat "" (List.map string_of_data_type fdecl.data_type) ^ "\n{\n" ^
    String.concat "" (List.map string_of_vdecl fdecl.locals) ^
    String.concat "" (List.map string_of_stmt fdecl.body) ^
    "}\n"
  *)


let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)

  
