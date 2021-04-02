type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | RBRACK
  | LBRACK
  | TRANSPOSE
  | INVERSE
  | STRUCT
  | NOT
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | TRUE
  | FALSE
  | AND
  | OR
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | STRING
  | BOOL
  | DOUBLE
  | CHAR
  | VOID
  | CR
  | DOT
  | MATRIX
  | VECTOR
  | FUNC
  | INTLIT of (int)
  | BLIT of (bool)
  | ID of (string)
  | DOUBLELIT of (string)
  | STRINGLIT of (string)
  | CHARLIT of (char)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
