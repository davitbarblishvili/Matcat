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
  | AND
  | OR
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | FLOAT
  | CHAR
  | VOID
  | CR
  | DOT
  | MATRIX
  | VECTOR
  | FUNC
  | LITERAL of (int)
  | BLIT of (bool)
  | ID of (string)
  | FLOATLIT of (string)
  | STRINGLIT of (string)
  | CHARLIT of (char)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> ().program
