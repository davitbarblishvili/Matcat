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

open Parsing;;
let _ = parse_error;;
# 4 "parser.mly"
open Ast
# 58 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIVIDE *);
  267 (* ASSIGN *);
  268 (* RBRACK *);
  269 (* LBRACK *);
  270 (* TRANSPOSE *);
  271 (* INVERSE *);
  272 (* STRUCT *);
  273 (* NOT *);
  274 (* EQ *);
  275 (* NEQ *);
  276 (* LT *);
  277 (* LEQ *);
  278 (* GT *);
  279 (* GEQ *);
  280 (* TRUE *);
  281 (* FALSE *);
  282 (* AND *);
  283 (* OR *);
  284 (* RETURN *);
  285 (* IF *);
  286 (* ELSE *);
  287 (* FOR *);
  288 (* WHILE *);
  289 (* INT *);
  290 (* STRING *);
  291 (* BOOL *);
  292 (* DOUBLE *);
  293 (* CHAR *);
  294 (* VOID *);
  295 (* CR *);
  296 (* DOT *);
  297 (* MATRIX *);
  298 (* VECTOR *);
  299 (* FUNC *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  300 (* INTLIT *);
  301 (* BLIT *);
  302 (* ID *);
  303 (* DOUBLELIT *);
  304 (* STRINGLIT *);
  305 (* CHARLIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\005\000\005\000\009\000\
\009\000\006\000\006\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\007\000\007\000\003\000\003\000\008\000\
\008\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\013\000\013\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\014\000\
\014\000\016\000\016\000\017\000\015\000\015\000\018\000\018\000\
\019\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\010\000\000\000\001\000\002\000\
\004\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\000\000\002\000\003\000\005\000\000\000\
\002\000\002\000\003\000\003\000\005\000\007\000\009\000\005\000\
\000\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\002\000\002\000\
\002\000\002\000\003\000\004\000\003\000\003\000\003\000\000\000\
\001\000\000\000\001\000\001\000\001\000\003\000\001\000\003\000\
\001\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\074\000\000\000\012\000\019\000\013\000\014\000\
\015\000\016\000\017\000\018\000\000\000\001\000\003\000\004\000\
\000\000\000\000\000\000\000\000\022\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\039\000\040\000\
\035\000\037\000\000\000\036\000\038\000\041\000\000\000\000\000\
\000\000\008\000\000\000\055\000\057\000\058\000\056\000\000\000\
\000\000\023\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\010\000\000\000\061\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\062\000\063\000\020\000\000\000\
\009\000\060\000\000\000\000\000\011\000\000\000\021\000\000\000\
\024\000\005\000\000\000\000\000\000\000\000\000\000\000\025\000\
\000\000\000\000\000\000\000\000\000\000\000\000\026\000\028\000\
\027\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\032\000\000\000\000\000\030\000\000\000\000\000\031\000"

let yydgoto = "\002\000\
\003\000\004\000\015\000\016\000\023\000\065\000\092\000\096\000\
\024\000\017\000\103\000\104\000\107\000\070\000\071\000\000\000\
\000\000\000\000\000\000"

let yysindex = "\010\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\224\254\000\000\000\000\000\000\
\231\254\070\255\002\255\076\000\000\000\091\000\071\255\067\255\
\033\255\091\000\091\000\091\000\091\000\091\000\000\000\000\000\
\000\000\000\000\049\255\000\000\000\000\000\000\146\000\076\000\
\076\000\000\000\217\000\000\000\000\000\000\000\000\000\091\000\
\091\000\000\000\091\000\091\000\091\000\091\000\091\000\091\000\
\091\000\091\000\091\000\091\000\091\000\091\000\091\000\091\000\
\006\255\000\000\037\255\000\000\036\255\079\255\083\255\036\255\
\010\255\010\255\013\255\013\255\056\000\056\000\008\255\008\255\
\008\255\008\255\009\000\034\001\000\000\000\000\000\000\076\000\
\000\000\000\000\091\000\076\000\000\000\036\255\000\000\076\255\
\000\000\000\000\091\000\093\255\101\255\104\255\169\000\000\000\
\124\255\036\255\084\255\091\000\091\000\091\000\000\000\000\000\
\000\000\242\000\114\255\011\001\043\000\091\000\043\000\086\255\
\192\000\000\000\043\000\091\000\000\000\116\255\043\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\127\255\000\000\000\000\000\000\128\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\123\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\130\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\022\255\000\000\131\255\065\255\
\091\255\139\255\058\001\085\001\101\000\021\001\187\255\235\255\
\095\001\122\001\227\000\019\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\172\255\000\000\058\255\000\000\000\000\
\000\000\000\000\126\255\000\000\000\000\000\000\000\000\000\000\
\000\000\064\255\000\000\000\000\126\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\220\255\
\000\000\000\000\000\000\132\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\044\000\000\000\000\000\000\000\000\000\040\000\
\000\000\238\255\234\255\075\000\156\255\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yytablesize = 661
let yytable = "\039\000\
\014\000\025\000\021\000\043\000\044\000\045\000\046\000\047\000\
\115\000\087\000\001\000\088\000\022\000\018\000\051\000\052\000\
\053\000\054\000\053\000\054\000\019\000\066\000\067\000\126\000\
\069\000\069\000\072\000\069\000\073\000\074\000\075\000\076\000\
\077\000\078\000\079\000\080\000\081\000\082\000\083\000\084\000\
\085\000\086\000\051\000\052\000\053\000\054\000\063\000\064\000\
\063\000\064\000\048\000\063\000\064\000\055\000\056\000\057\000\
\058\000\059\000\060\000\049\000\070\000\061\000\062\000\070\000\
\034\000\059\000\034\000\059\000\094\000\093\000\059\000\020\000\
\041\000\040\000\063\000\064\000\106\000\026\000\042\000\097\000\
\098\000\090\000\089\000\027\000\113\000\114\000\106\000\116\000\
\091\000\028\000\029\000\043\000\030\000\043\000\108\000\121\000\
\043\000\043\000\043\000\031\000\032\000\106\000\109\000\099\000\
\100\000\110\000\101\000\102\000\043\000\043\000\043\000\043\000\
\043\000\043\000\118\000\123\000\043\000\043\000\127\000\033\000\
\034\000\035\000\036\000\037\000\038\000\026\000\033\000\097\000\
\112\000\006\000\007\000\027\000\064\000\065\000\033\000\095\000\
\105\000\028\000\029\000\044\000\030\000\044\000\000\000\000\000\
\044\000\044\000\044\000\031\000\032\000\000\000\000\000\099\000\
\100\000\000\000\101\000\102\000\044\000\044\000\044\000\044\000\
\044\000\044\000\000\000\000\000\044\000\044\000\000\000\033\000\
\034\000\035\000\036\000\037\000\038\000\024\000\000\000\024\000\
\024\000\000\000\000\000\024\000\000\000\000\000\000\000\000\000\
\000\000\024\000\024\000\049\000\024\000\049\000\000\000\120\000\
\049\000\122\000\000\000\024\000\024\000\125\000\000\000\024\000\
\024\000\128\000\024\000\024\000\049\000\049\000\049\000\049\000\
\049\000\049\000\000\000\000\000\049\000\049\000\000\000\024\000\
\024\000\024\000\024\000\024\000\024\000\029\000\000\000\029\000\
\029\000\000\000\000\000\029\000\000\000\000\000\000\000\000\000\
\000\000\029\000\029\000\050\000\029\000\050\000\000\000\000\000\
\050\000\000\000\000\000\029\000\029\000\000\000\000\000\029\000\
\029\000\000\000\029\000\029\000\050\000\050\000\050\000\050\000\
\050\000\050\000\000\000\000\000\050\000\050\000\000\000\029\000\
\029\000\029\000\029\000\029\000\029\000\000\000\000\000\051\000\
\052\000\053\000\054\000\054\000\000\000\054\000\000\000\000\000\
\054\000\000\000\055\000\056\000\057\000\058\000\059\000\060\000\
\000\000\005\000\006\000\007\000\008\000\009\000\010\000\000\000\
\000\000\011\000\012\000\013\000\026\000\054\000\097\000\063\000\
\064\000\000\000\027\000\000\000\000\000\000\000\000\000\000\000\
\028\000\029\000\000\000\030\000\000\000\000\000\051\000\052\000\
\053\000\054\000\031\000\032\000\000\000\000\000\099\000\100\000\
\000\000\101\000\102\000\057\000\058\000\059\000\060\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\033\000\034\000\
\035\000\036\000\037\000\038\000\026\000\000\000\063\000\064\000\
\000\000\000\000\027\000\000\000\000\000\047\000\000\000\047\000\
\028\000\029\000\047\000\030\000\005\000\006\000\007\000\008\000\
\009\000\010\000\031\000\032\000\011\000\012\000\047\000\047\000\
\000\000\000\000\000\000\042\000\000\000\042\000\047\000\047\000\
\042\000\042\000\042\000\042\000\042\000\000\000\033\000\034\000\
\035\000\036\000\037\000\038\000\042\000\042\000\042\000\042\000\
\042\000\042\000\050\000\000\000\042\000\042\000\000\000\000\000\
\051\000\052\000\053\000\054\000\000\000\000\000\000\000\000\000\
\000\000\042\000\042\000\055\000\056\000\057\000\058\000\059\000\
\060\000\111\000\000\000\061\000\062\000\000\000\000\000\051\000\
\052\000\053\000\054\000\000\000\000\000\000\000\000\000\000\000\
\063\000\064\000\055\000\056\000\057\000\058\000\059\000\060\000\
\124\000\000\000\061\000\062\000\000\000\000\000\051\000\052\000\
\053\000\054\000\000\000\000\000\000\000\000\000\000\000\063\000\
\064\000\055\000\056\000\057\000\058\000\059\000\060\000\000\000\
\000\000\061\000\062\000\068\000\000\000\000\000\000\000\051\000\
\052\000\053\000\054\000\053\000\000\000\053\000\063\000\064\000\
\053\000\000\000\055\000\056\000\057\000\058\000\059\000\060\000\
\000\000\000\000\061\000\062\000\117\000\000\000\000\000\000\000\
\051\000\052\000\053\000\054\000\053\000\053\000\000\000\063\000\
\064\000\000\000\000\000\055\000\056\000\057\000\058\000\059\000\
\060\000\000\000\000\000\061\000\062\000\119\000\000\000\000\000\
\000\000\051\000\052\000\053\000\054\000\048\000\000\000\048\000\
\063\000\064\000\048\000\000\000\055\000\056\000\057\000\058\000\
\059\000\060\000\000\000\000\000\061\000\062\000\048\000\048\000\
\051\000\052\000\053\000\054\000\000\000\000\000\048\000\048\000\
\000\000\063\000\064\000\055\000\056\000\057\000\058\000\059\000\
\060\000\000\000\045\000\061\000\045\000\000\000\000\000\045\000\
\045\000\045\000\045\000\045\000\000\000\000\000\000\000\000\000\
\063\000\064\000\000\000\045\000\045\000\045\000\045\000\045\000\
\045\000\000\000\000\000\045\000\045\000\046\000\000\000\046\000\
\000\000\000\000\046\000\046\000\046\000\046\000\046\000\051\000\
\000\000\051\000\000\000\000\000\051\000\000\000\046\000\046\000\
\046\000\046\000\046\000\046\000\000\000\000\000\046\000\046\000\
\051\000\051\000\051\000\051\000\051\000\051\000\000\000\000\000\
\051\000\051\000\052\000\000\000\052\000\000\000\000\000\052\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\052\000\052\000\052\000\052\000\052\000\
\052\000\000\000\000\000\052\000\052\000"

let yycheck = "\022\000\
\000\000\020\000\001\001\026\000\027\000\028\000\029\000\030\000\
\109\000\004\001\001\000\006\001\011\001\046\001\007\001\008\001\
\009\001\010\001\009\001\010\001\046\001\040\000\041\000\124\000\
\003\001\048\000\049\000\006\001\051\000\052\000\053\000\054\000\
\055\000\056\000\057\000\058\000\059\000\060\000\061\000\062\000\
\063\000\064\000\007\001\008\001\009\001\010\001\039\001\040\001\
\039\001\040\001\002\001\039\001\040\001\018\001\019\001\020\001\
\021\001\022\001\023\001\011\001\003\001\026\001\027\001\006\001\
\001\001\001\001\003\001\003\001\091\000\088\000\006\001\002\001\
\006\001\003\001\039\001\040\001\099\000\002\001\046\001\004\001\
\005\001\003\001\046\001\008\001\001\001\108\000\109\000\110\000\
\006\001\014\001\015\001\001\001\017\001\003\001\002\001\118\000\
\006\001\007\001\008\001\024\001\025\001\124\000\002\001\028\001\
\029\001\002\001\031\001\032\001\018\001\019\001\020\001\021\001\
\022\001\023\001\001\001\030\001\026\001\027\001\003\001\044\001\
\045\001\046\001\047\001\048\001\049\001\002\001\001\001\004\001\
\005\001\003\001\003\001\008\001\003\001\003\001\003\001\092\000\
\097\000\014\001\015\001\001\001\017\001\003\001\255\255\255\255\
\006\001\007\001\008\001\024\001\025\001\255\255\255\255\028\001\
\029\001\255\255\031\001\032\001\018\001\019\001\020\001\021\001\
\022\001\023\001\255\255\255\255\026\001\027\001\255\255\044\001\
\045\001\046\001\047\001\048\001\049\001\002\001\255\255\004\001\
\005\001\255\255\255\255\008\001\255\255\255\255\255\255\255\255\
\255\255\014\001\015\001\001\001\017\001\003\001\255\255\117\000\
\006\001\119\000\255\255\024\001\025\001\123\000\255\255\028\001\
\029\001\127\000\031\001\032\001\018\001\019\001\020\001\021\001\
\022\001\023\001\255\255\255\255\026\001\027\001\255\255\044\001\
\045\001\046\001\047\001\048\001\049\001\002\001\255\255\004\001\
\005\001\255\255\255\255\008\001\255\255\255\255\255\255\255\255\
\255\255\014\001\015\001\001\001\017\001\003\001\255\255\255\255\
\006\001\255\255\255\255\024\001\025\001\255\255\255\255\028\001\
\029\001\255\255\031\001\032\001\018\001\019\001\020\001\021\001\
\022\001\023\001\255\255\255\255\026\001\027\001\255\255\044\001\
\045\001\046\001\047\001\048\001\049\001\255\255\255\255\007\001\
\008\001\009\001\010\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\255\255\033\001\034\001\035\001\036\001\037\001\038\001\255\255\
\255\255\041\001\042\001\043\001\002\001\027\001\004\001\039\001\
\040\001\255\255\008\001\255\255\255\255\255\255\255\255\255\255\
\014\001\015\001\255\255\017\001\255\255\255\255\007\001\008\001\
\009\001\010\001\024\001\025\001\255\255\255\255\028\001\029\001\
\255\255\031\001\032\001\020\001\021\001\022\001\023\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\044\001\045\001\
\046\001\047\001\048\001\049\001\002\001\255\255\039\001\040\001\
\255\255\255\255\008\001\255\255\255\255\001\001\255\255\003\001\
\014\001\015\001\006\001\017\001\033\001\034\001\035\001\036\001\
\037\001\038\001\024\001\025\001\041\001\042\001\018\001\019\001\
\255\255\255\255\255\255\001\001\255\255\003\001\026\001\027\001\
\006\001\007\001\008\001\009\001\010\001\255\255\044\001\045\001\
\046\001\047\001\048\001\049\001\018\001\019\001\020\001\021\001\
\022\001\023\001\001\001\255\255\026\001\027\001\255\255\255\255\
\007\001\008\001\009\001\010\001\255\255\255\255\255\255\255\255\
\255\255\039\001\040\001\018\001\019\001\020\001\021\001\022\001\
\023\001\001\001\255\255\026\001\027\001\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\255\255\
\039\001\040\001\018\001\019\001\020\001\021\001\022\001\023\001\
\001\001\255\255\026\001\027\001\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\255\255\255\255\039\001\
\040\001\018\001\019\001\020\001\021\001\022\001\023\001\255\255\
\255\255\026\001\027\001\003\001\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\001\001\255\255\003\001\039\001\040\001\
\006\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\255\255\255\255\026\001\027\001\003\001\255\255\255\255\255\255\
\007\001\008\001\009\001\010\001\026\001\027\001\255\255\039\001\
\040\001\255\255\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\255\255\255\255\026\001\027\001\003\001\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\001\001\255\255\003\001\
\039\001\040\001\006\001\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\255\255\255\255\026\001\027\001\018\001\019\001\
\007\001\008\001\009\001\010\001\255\255\255\255\026\001\027\001\
\255\255\039\001\040\001\018\001\019\001\020\001\021\001\022\001\
\023\001\255\255\001\001\026\001\003\001\255\255\255\255\006\001\
\007\001\008\001\009\001\010\001\255\255\255\255\255\255\255\255\
\039\001\040\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\255\255\255\255\026\001\027\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\009\001\010\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\255\255\255\255\026\001\027\001\
\018\001\019\001\020\001\021\001\022\001\023\001\255\255\255\255\
\026\001\027\001\001\001\255\255\003\001\255\255\255\255\006\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\255\255\255\255\026\001\027\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  RBRACK\000\
  LBRACK\000\
  TRANSPOSE\000\
  INVERSE\000\
  STRUCT\000\
  NOT\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  STRING\000\
  BOOL\000\
  DOUBLE\000\
  CHAR\000\
  VOID\000\
  CR\000\
  DOT\000\
  MATRIX\000\
  VECTOR\000\
  FUNC\000\
  EOF\000\
  "

let yynames_block = "\
  INTLIT\000\
  BLIT\000\
  ID\000\
  DOUBLELIT\000\
  STRINGLIT\000\
  CHARLIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 40 "parser.mly"
            ( _1 )
# 437 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
                 ( ([], [])               )
# 443 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 44 "parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 451 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 45 "parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 459 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 6 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : 'type_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 51 "parser.mly"
     ( { 
	 fname = _2;
	 formals = List.rev _4;
	 data_type = List.rev _6;
	 locals = List.rev _8;
	 body = List.rev _9 } )
# 475 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
                  ( [] )
# 481 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 59 "parser.mly"
                  ( _1 )
# 488 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 62 "parser.mly"
                             ( [(_1,_2,Noexpr)]     )
# 496 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "parser.mly"
                             ( (_3,_4,Noexpr) :: _1 )
# 505 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 69 "parser.mly"
                     ([(_1)])
# 512 "parser.ml"
               : 'type_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'type_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 70 "parser.mly"
                         (_3::_1)
# 520 "parser.ml"
               : 'type_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
            ( Int    )
# 526 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
            ( Bool   )
# 532 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
            ( Double )
# 538 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
            ( Char   )
# 544 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "parser.mly"
            ( Void   )
# 550 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 79 "parser.mly"
            ( Matrix )
# 556 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
            ( Vector )
# 562 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
            ( String )
# 568 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "parser.mly"
                     ( [] )
# 574 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 86 "parser.mly"
                     ( _2 :: _1 )
# 582 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 89 "parser.mly"
               ( (_1, _2, Noexpr) )
# 590 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                           ( (_1, _2, Assign(_2,_4)))
# 599 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
                   ( [] )
# 605 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 94 "parser.mly"
                   ( _2 :: _1 )
# 613 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                                            ( Expr _1               )
# 620 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 98 "parser.mly"
                                            ( Return _2             )
# 627 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 100 "parser.mly"
                                            ( Block(List.rev _2)    )
# 634 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 101 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 642 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 102 "parser.mly"
                                            ( If(_3, _5, _7)        )
# 651 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 104 "parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 661 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 105 "parser.mly"
                                            ( While(_3, _5)         )
# 669 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 108 "parser.mly"
                  ( Noexpr )
# 675 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                  ( _1 )
# 682 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 112 "parser.mly"
                    ( IntLit(_1)            )
# 689 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 113 "parser.mly"
                     ( DoubleLit(_1)      )
# 696 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 114 "parser.mly"
                     ( BoolLit(_1)            )
# 703 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 115 "parser.mly"
                     ( StringLit(_1)          )
# 710 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 116 "parser.mly"
                     ( BoolLit(true)          )
# 716 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 117 "parser.mly"
                     ( BoolLit(false)         )
# 722 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 118 "parser.mly"
                     ( CharLit(_1)            )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 119 "parser.mly"
                     ( Id(_1)                 )
# 736 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 744 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 752 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 760 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 768 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 776 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 784 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 792 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 800 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 808 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 816 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parser.mly"
                     ( Binop(_1, And,   _3)   )
# 824 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 832 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "parser.mly"
                         ( Unop(Neg, _2)      )
# 839 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                     ( Unop(Not, _2)          )
# 846 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                     ( Unop(Transpose, _2)    )
# 853 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                     ( Unop(Inverse, _2)      )
# 860 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parser.mly"
                     ( Assign(_1, _3)         )
# 868 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 137 "parser.mly"
                              ( Call(_1, _3)  )
# 876 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 138 "parser.mly"
                       ( _2                   )
# 883 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 141 "parser.mly"
                     ( Binop(_1,Cr,_3)        )
# 891 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parser.mly"
                     ( Binop(_1,Dot,_3)       )
# 899 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 154 "parser.mly"
                  ( [] )
# 905 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 155 "parser.mly"
               ( List.rev _1 )
# 912 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    Obj.repr(
# 158 "parser.mly"
    ( [] )
# 918 "parser.ml"
               : 'args_opt_vector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list_vector) in
    Obj.repr(
# 159 "parser.mly"
                      ( List.rev _1 )
# 925 "parser.ml"
               : 'args_opt_vector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 162 "parser.mly"
               ( [_1] )
# 932 "parser.ml"
               : 'args_list_vector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 165 "parser.mly"
                            ( [_1] )
# 939 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 166 "parser.mly"
                            ( _3 :: _1 )
# 947 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_opt) in
    Obj.repr(
# 169 "parser.mly"
                              ( [_1] )
# 954 "parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'matrix_value) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'args_opt) in
    Obj.repr(
# 170 "parser.mly"
                              (_3 :: _1)
# 962 "parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_opt_vector) in
    Obj.repr(
# 173 "parser.mly"
                     ([_1])
# 969 "parser.ml"
               : 'vector_value))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
