(*
Author: Matcat team
Copyright 2021, Matcat
*)

type operator = Add | Sub | Mult | Div | Equal
              | Neq | Less | Leq | Greater 
              | Geq | And | Or | Cr | Dot 
              

type unary_operator = Not | Neg 

type data_type = Int | Double | String | Void | Bool | Matrix

type bind = data_type * string

type expr =
  IntLit of int
| Binop of expr * operator * expr
| Unop of unary_operator * expr
| DoubleLit of string
| StringLit of string
| BoolLit of bool
| MatrixLit of expr list
| Id of string
| Assign of string * expr
| Call of string * expr list
| MatrixAccess of string * expr * expr
| MatrixAccess1D of string * expr
| MatrixAccessCol of string * expr
| MatrixDiagonal of string
| MatrixPower of string * expr
| Noexpr
| Noassign

type stmt =
  Block of stmt list
| Expr of expr
| Return of expr
| If of expr * stmt * stmt
| For of expr * expr * expr * stmt
| While of expr * stmt
| Vdecl of bind * expr


type func_decl = {
    fname : string;
    formals : bind list;
	  data_type : data_type;
    locals : bind list;
    body : stmt list;
  }

type program = stmt list * func_decl list


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


let string_of_data_type = function
    Int -> "int"
  | Bool -> "bool"
  | Double -> "double"
  | String -> "string"
  | Matrix -> "matrix"
  | Void -> "void"

(* Pretty-printing functions *)
let string_of_bind bind =
  string_of_data_type (fst bind) ^ " " ^ (snd bind)

let rec string_of_expr = function
      IntLit (l) -> string_of_int l
    | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_operator o ^ " " ^ string_of_expr e2
    | Unop(o, e) -> string_of_uop o ^ string_of_expr e
    | DoubleLit(l) -> l
    | StringLit(l) -> l
    | BoolLit(true) -> "true"   
    | BoolLit(false) -> "false"
    | MatrixLit(l) ->  "matrixLit[" ^ String.concat ", " (List.map string_of_expr l) ^ "]"
    | Id(s) -> s
    | Assign(v, e) -> v ^ " = " ^ string_of_expr e
    | MatrixAccess(s,e1,e2)-> "MatrixAccess " ^ s ^ "[" ^ string_of_expr(e1) ^ "]" ^ "[" ^ string_of_expr(e2) ^ "]"
    | MatrixAccess1D(s,e1)-> "MatrixAccess1D " ^ s ^ "[" ^ string_of_expr(e1) ^ ",:]"
    | MatrixAccessCol(s,e1)-> "MatrixAccessCol " ^ s ^ "[:," ^ string_of_expr(e1) ^ "]"
    | MatrixDiagonal(s)-> "MatrixDiagonal " ^ s ^ "[:, :]"
    | MatrixPower(s,e1) -> "MatrixPower " ^ s ^"^" ^ string_of_expr(e1)
    | Call(f, el) ->
        f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
    | Noexpr -> "(Noexpr)"
    | Noassign -> "(Noassign)"

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
  | Vdecl(b, e) -> match e with
      Noassign -> string_of_bind b ^ ";\n"
    | _      -> string_of_bind b ^" = "^ string_of_expr e ^ ";\n"

  (*variable declaration*)
let string_of_vdecl (t, id) = string_of_data_type t ^ " " ^ id ^ ";\n"

let string_of_formals formals = List.map string_of_bind formals

let string_of_fdecl fdecl =
  "func " ^
  fdecl.fname ^ "(" ^ String.concat ", " (string_of_formals fdecl.formals) ^
  ")" ^ string_of_data_type fdecl.data_type ^ "\n{\n" ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"


let string_of_global (b, e) = 
  if string_of_expr e = "" 
  then string_of_bind b ^ ";\n"
  else string_of_bind b ^" = "^ string_of_expr e ^ ";\n"


let string_of_program (stmts, funcs) =
  String.concat "\n" (List.map string_of_fdecl funcs) ^ "\n" ^
  String.concat "" (List.map string_of_stmt stmts)

  
