(* Ocamllex scanner for Matcat *)

{ open Parser } 

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { multi_comment lexbuf }           (* Comments *)
| "//" { short_comment lexbuf }
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '='      { ASSIGN }
| "transpose" {TRANSPOSE}
| "inverse"   {INVERSE}
| "cr"       {CR}
| "dot"       {DOT}
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }
| "func"   {FUNC}
| "int"    { INT }
| "bool"   { BOOL }
| "matrix" {MATRIX}
| "vector" {VECTOR}
| "float"  { FLOAT }
| "void"   { VOID }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| ['0'-'9']+ as lit { INTLIT(int_of_string lit) }
| '"' ([^ '"']* as lit) '"' { STRINGLIT(lit) }
| (['0'-'9']*)'.'(['0'-'9']+) as lit { DOUBLELIT(float_of_string lit) }
| (['0'-'9']+)'.'(['0'-'9']*) as lit { DOUBLELIT(float_of_string lit) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*  as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and multi_comment = parse 
		"*/" { token lexbuf } 
		(* Return to normal scanning *)
		| _ { multi_comment lexbuf }

and short_comment = parse 
		"\n" { token lexbuf } 
		| _ { short_comment lexbuf }

