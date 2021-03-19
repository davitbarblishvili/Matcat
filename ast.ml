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
  Binop of expr * operator * expr
| Unop of unary_operator * expr
| Doubleliteral of float
| StrLit of string
| BoolLit of bool
| CharLit of char
| MatrixLit of float array array
| Id of string
| Assign of string * expr
| Call of string * expr list
| Noexpr


type bind = data_type * string * expr

type stmt =
  Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
(*our func lists return types before body of the funct
Also not sure where to include Funct keyword*)

type func_decl = {
    
    fname : string;
    formals : bind list;
	typs : data_type list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list


(* Pretty-printing functions *)
let string_of_operators = function
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



  (* 1) missing let rec string_of_expr; I just included initial lines of each block*)
  let rec string_of_expr = function 
   Noexpr -> ""

  (* 2) missing let rec string_of_stmt; I just included initial lines of each block *)
  let rec string_of_stmt = function 
   Noexpr -> ""



  (*variable declaration*)
  let string_of_vdecl (t, id, _) = string_of_data_type t ^ " " ^ id ^ ";\n"



  (* 3) missing let string_of_fdcl;  *)
  let string_of_fdecl fdecl = ""

  
  let string_of_program (vars, funcs) =
    String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
    String.concat "\n" (List.map string_of_fdecl funcs)





