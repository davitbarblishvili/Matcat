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

open Parsing;;
let _ = parse_error;;
# 4 "Matcat_Parser.mly"
open ()
# 52 "Matcat_Parser.ml"
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
  270 (* NOT *);
  271 (* EQ *);
  272 (* NEQ *);
  273 (* LT *);
  274 (* LEQ *);
  275 (* GT *);
  276 (* GEQ *);
  277 (* AND *);
  278 (* OR *);
  279 (* RETURN *);
  280 (* IF *);
  281 (* ELSE *);
  282 (* FOR *);
  283 (* WHILE *);
  284 (* INT *);
  285 (* BOOL *);
  286 (* FLOAT *);
  287 (* CHAR *);
  288 (* VOID *);
  289 (* CR *);
  290 (* DOT *);
  291 (* MATRIX *);
  292 (* VECTOR *);
  293 (* FUNC *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  294 (* LITERAL *);
  295 (* BLIT *);
  296 (* ID *);
  297 (* FLOATLIT *);
  298 (* STRINGLIT *);
  299 (* CHARLIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\005\000\005\000\009\000\
\009\000\006\000\006\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\007\000\007\000\003\000\008\000\008\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\013\000\013\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\014\000\014\000\017\000\017\000\016\000\
\015\000\015\000\015\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\010\000\000\000\001\000\002\000\
\004\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\000\000\002\000\003\000\000\000\002\000\002\000\
\003\000\003\000\005\000\007\000\009\000\005\000\000\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000\002\000\003\000\004\000\003\000\003\000\
\003\000\003\000\003\000\000\000\001\000\001\000\003\000\001\000\
\003\000\005\000\004\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\068\000\000\000\012\000\013\000\014\000\015\000\
\016\000\017\000\018\000\000\000\001\000\003\000\004\000\000\000\
\000\000\000\000\000\000\021\000\000\000\000\000\000\000\000\000\
\000\000\008\000\000\000\010\000\000\000\019\000\000\000\009\000\
\000\000\011\000\020\000\000\000\000\000\022\000\005\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\033\000\
\035\000\000\000\034\000\036\000\037\000\023\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\024\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\055\000\026\000\
\059\000\000\000\000\000\058\000\025\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\056\000\
\057\000\000\000\000\000\000\000\000\000\000\000\054\000\000\000\
\067\000\000\000\000\000\030\000\066\000\000\000\000\000\028\000\
\000\000\000\000\029\000"

let yydgoto = "\002\000\
\003\000\004\000\014\000\015\000\021\000\027\000\033\000\036\000\
\022\000\016\000\054\000\055\000\066\000\097\000\064\000\060\000\
\061\000"

let yysindex = "\034\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\010\255\000\000\000\000\000\000\014\255\
\053\255\074\255\206\255\000\000\073\255\086\255\045\255\206\255\
\206\255\000\000\121\255\000\000\060\255\000\000\206\255\000\000\
\206\255\000\000\000\000\055\255\231\255\000\000\000\000\231\255\
\231\255\231\255\090\255\231\255\102\255\113\255\120\255\000\000\
\000\000\013\255\000\000\000\000\000\000\000\000\033\000\075\000\
\097\255\244\254\135\000\117\255\124\255\244\254\231\255\112\255\
\135\000\133\255\231\255\231\255\231\255\231\255\231\255\000\000\
\231\255\231\255\231\255\231\255\231\255\231\255\231\255\231\255\
\231\255\231\255\231\255\231\255\231\255\231\255\000\000\000\000\
\000\000\231\255\059\255\000\000\000\000\095\000\141\255\115\000\
\142\255\124\255\135\000\018\255\018\255\244\254\244\254\099\255\
\099\255\079\255\079\255\079\255\079\255\175\000\155\000\000\000\
\000\000\135\000\003\255\189\255\231\255\189\255\000\000\090\255\
\000\000\123\255\055\000\000\000\000\000\189\255\231\255\000\000\
\143\255\189\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\147\255\000\000\000\000\152\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\139\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\156\255\000\000\000\000\000\000\000\000\
\000\000\246\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\195\000\011\255\000\000\146\255\217\000\000\000\000\000\
\125\255\000\000\000\000\156\255\000\000\158\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\164\255\061\255\027\001\049\001\239\000\005\001\159\001\
\167\001\071\001\093\001\115\001\137\001\148\255\007\255\000\000\
\000\000\071\255\140\255\000\000\000\000\000\000\000\000\000\000\
\000\000\181\255\000\000\000\000\000\000\000\000\165\255\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\131\000\000\000\000\000\000\000\000\000\133\000\
\000\000\243\255\196\255\219\255\190\255\000\000\161\255\000\000\
\021\000"

let yytablesize = 701
let yytable = "\056\000\
\013\000\095\000\058\000\059\000\062\000\023\000\065\000\050\000\
\120\000\050\000\028\000\029\000\050\000\062\000\070\000\063\000\
\062\000\034\000\050\000\121\000\085\000\086\000\062\000\071\000\
\125\000\059\000\075\000\076\000\050\000\094\000\065\000\096\000\
\059\000\099\000\001\000\100\000\101\000\102\000\103\000\104\000\
\105\000\106\000\107\000\108\000\109\000\110\000\111\000\112\000\
\113\000\017\000\085\000\086\000\114\000\018\000\019\000\122\000\
\037\000\124\000\038\000\039\000\129\000\053\000\040\000\053\000\
\090\000\128\000\053\000\041\000\042\000\131\000\115\000\043\000\
\053\000\063\000\020\000\024\000\063\000\044\000\045\000\123\000\
\046\000\047\000\063\000\091\000\026\000\073\000\074\000\075\000\
\076\000\065\000\098\000\025\000\048\000\049\000\050\000\051\000\
\052\000\053\000\037\000\032\000\038\000\088\000\063\000\067\000\
\040\000\073\000\074\000\075\000\076\000\041\000\042\000\085\000\
\086\000\043\000\068\000\079\000\080\000\081\000\082\000\044\000\
\045\000\069\000\046\000\047\000\030\000\032\000\031\000\032\000\
\089\000\090\000\092\000\085\000\086\000\093\000\048\000\049\000\
\050\000\051\000\052\000\053\000\022\000\117\000\022\000\022\000\
\119\000\130\000\022\000\126\000\049\000\006\000\049\000\022\000\
\022\000\049\000\007\000\022\000\031\000\064\000\065\000\049\000\
\060\000\022\000\022\000\035\000\022\000\022\000\061\000\031\000\
\049\000\049\000\057\000\000\000\000\000\000\000\000\000\000\000\
\022\000\022\000\022\000\022\000\022\000\022\000\027\000\000\000\
\027\000\027\000\000\000\000\000\027\000\000\000\037\000\000\000\
\038\000\027\000\027\000\000\000\040\000\027\000\000\000\000\000\
\000\000\041\000\042\000\027\000\027\000\043\000\027\000\027\000\
\000\000\000\000\000\000\044\000\045\000\000\000\046\000\047\000\
\000\000\000\000\027\000\027\000\027\000\027\000\027\000\027\000\
\000\000\000\000\048\000\049\000\050\000\051\000\052\000\053\000\
\037\000\005\000\006\000\007\000\008\000\009\000\040\000\000\000\
\010\000\011\000\000\000\041\000\042\000\000\000\038\000\043\000\
\038\000\000\000\000\000\038\000\038\000\038\000\038\000\038\000\
\000\000\038\000\000\000\000\000\038\000\038\000\038\000\038\000\
\038\000\038\000\038\000\038\000\048\000\049\000\050\000\051\000\
\052\000\053\000\000\000\000\000\000\000\000\000\038\000\038\000\
\000\000\000\000\000\000\000\000\005\000\006\000\007\000\008\000\
\009\000\072\000\000\000\010\000\011\000\012\000\000\000\073\000\
\074\000\075\000\076\000\000\000\000\000\000\000\000\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\084\000\127\000\
\000\000\000\000\000\000\000\000\000\000\073\000\074\000\075\000\
\076\000\085\000\086\000\000\000\000\000\077\000\078\000\079\000\
\080\000\081\000\082\000\083\000\084\000\087\000\000\000\000\000\
\000\000\073\000\074\000\075\000\076\000\000\000\000\000\085\000\
\086\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\084\000\116\000\000\000\000\000\000\000\073\000\074\000\075\000\
\076\000\000\000\000\000\085\000\086\000\077\000\078\000\079\000\
\080\000\081\000\082\000\083\000\084\000\118\000\000\000\000\000\
\000\000\073\000\074\000\075\000\076\000\000\000\000\000\085\000\
\086\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\084\000\000\000\000\000\000\000\000\000\073\000\074\000\075\000\
\076\000\000\000\000\000\085\000\086\000\077\000\078\000\079\000\
\080\000\081\000\082\000\083\000\084\000\000\000\000\000\000\000\
\000\000\073\000\074\000\075\000\076\000\000\000\000\000\085\000\
\086\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\000\000\000\000\000\000\000\000\000\000\073\000\074\000\075\000\
\076\000\000\000\000\000\085\000\086\000\077\000\078\000\079\000\
\080\000\081\000\082\000\051\000\000\000\051\000\000\000\000\000\
\051\000\051\000\051\000\051\000\051\000\000\000\051\000\085\000\
\086\000\051\000\051\000\051\000\051\000\051\000\051\000\051\000\
\051\000\052\000\000\000\052\000\000\000\000\000\052\000\052\000\
\052\000\052\000\052\000\000\000\052\000\000\000\000\000\052\000\
\052\000\052\000\052\000\052\000\052\000\052\000\052\000\041\000\
\000\000\041\000\000\000\000\000\041\000\041\000\041\000\041\000\
\041\000\000\000\041\000\000\000\000\000\041\000\041\000\041\000\
\041\000\041\000\041\000\041\000\041\000\042\000\000\000\042\000\
\000\000\000\000\042\000\042\000\042\000\042\000\042\000\000\000\
\042\000\000\000\000\000\042\000\042\000\042\000\042\000\042\000\
\042\000\042\000\042\000\039\000\000\000\039\000\000\000\000\000\
\039\000\039\000\039\000\000\000\000\000\000\000\039\000\000\000\
\000\000\039\000\039\000\039\000\039\000\039\000\039\000\039\000\
\039\000\040\000\000\000\040\000\000\000\000\000\040\000\040\000\
\040\000\000\000\000\000\000\000\040\000\000\000\000\000\040\000\
\040\000\040\000\040\000\040\000\040\000\040\000\040\000\045\000\
\000\000\045\000\000\000\000\000\045\000\000\000\000\000\000\000\
\000\000\000\000\045\000\000\000\000\000\045\000\045\000\045\000\
\045\000\045\000\045\000\045\000\045\000\046\000\000\000\046\000\
\000\000\000\000\046\000\000\000\000\000\000\000\000\000\000\000\
\046\000\000\000\000\000\046\000\046\000\046\000\046\000\046\000\
\046\000\046\000\046\000\047\000\000\000\047\000\000\000\000\000\
\047\000\000\000\000\000\000\000\000\000\000\000\047\000\000\000\
\000\000\047\000\047\000\047\000\047\000\047\000\047\000\047\000\
\047\000\048\000\000\000\048\000\000\000\000\000\048\000\000\000\
\000\000\000\000\000\000\000\000\048\000\000\000\000\000\048\000\
\048\000\048\000\048\000\048\000\048\000\048\000\048\000\043\000\
\000\000\043\000\000\000\000\000\043\000\000\000\000\000\044\000\
\000\000\044\000\043\000\000\000\044\000\043\000\043\000\000\000\
\000\000\000\000\044\000\043\000\043\000\044\000\044\000\000\000\
\000\000\000\000\000\000\044\000\044\000"

let yycheck = "\037\000\
\000\000\068\000\040\000\041\000\042\000\019\000\044\000\001\001\
\006\001\003\001\024\000\025\000\006\001\003\001\002\001\013\001\
\006\001\031\000\012\001\115\000\033\001\034\001\012\001\011\001\
\120\000\063\000\009\001\010\001\022\001\067\000\068\000\069\000\
\070\000\071\000\001\000\073\000\074\000\075\000\076\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\084\000\085\000\
\086\000\040\001\033\001\034\001\090\000\040\001\002\001\116\000\
\002\001\118\000\004\001\005\001\127\000\001\001\008\001\003\001\
\006\001\126\000\006\001\013\001\014\001\130\000\012\001\017\001\
\012\001\003\001\001\001\003\001\006\001\023\001\024\001\117\000\
\026\001\027\001\012\001\063\000\040\001\007\001\008\001\009\001\
\010\001\127\000\070\000\006\001\038\001\039\001\040\001\041\001\
\042\001\043\001\002\001\040\001\004\001\005\001\013\001\002\001\
\008\001\007\001\008\001\009\001\010\001\013\001\014\001\033\001\
\034\001\017\001\002\001\017\001\018\001\019\001\020\001\023\001\
\024\001\002\001\026\001\027\001\004\001\001\001\006\001\003\001\
\012\001\006\001\019\001\033\001\034\001\001\001\038\001\039\001\
\040\001\041\001\042\001\043\001\002\001\001\001\004\001\005\001\
\003\001\003\001\008\001\025\001\001\001\003\001\003\001\013\001\
\014\001\006\001\003\001\017\001\001\001\012\001\019\001\012\001\
\003\001\023\001\024\001\033\000\026\001\027\001\003\001\003\001\
\021\001\022\001\038\000\255\255\255\255\255\255\255\255\255\255\
\038\001\039\001\040\001\041\001\042\001\043\001\002\001\255\255\
\004\001\005\001\255\255\255\255\008\001\255\255\002\001\255\255\
\004\001\013\001\014\001\255\255\008\001\017\001\255\255\255\255\
\255\255\013\001\014\001\023\001\024\001\017\001\026\001\027\001\
\255\255\255\255\255\255\023\001\024\001\255\255\026\001\027\001\
\255\255\255\255\038\001\039\001\040\001\041\001\042\001\043\001\
\255\255\255\255\038\001\039\001\040\001\041\001\042\001\043\001\
\002\001\028\001\029\001\030\001\031\001\032\001\008\001\255\255\
\035\001\036\001\255\255\013\001\014\001\255\255\001\001\017\001\
\003\001\255\255\255\255\006\001\007\001\008\001\009\001\010\001\
\255\255\012\001\255\255\255\255\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\038\001\039\001\040\001\041\001\
\042\001\043\001\255\255\255\255\255\255\255\255\033\001\034\001\
\255\255\255\255\255\255\255\255\028\001\029\001\030\001\031\001\
\032\001\001\001\255\255\035\001\036\001\037\001\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\001\
\255\255\255\255\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\033\001\034\001\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\003\001\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\255\255\033\001\
\034\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\003\001\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\255\255\033\001\034\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\003\001\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\255\255\033\001\
\034\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\255\255\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\255\255\033\001\034\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\255\255\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\255\255\033\001\
\034\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\255\255\255\255\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\255\255\033\001\034\001\015\001\016\001\017\001\
\018\001\019\001\020\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\009\001\010\001\255\255\012\001\033\001\
\034\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\009\001\010\001\255\255\012\001\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\001\
\255\255\003\001\255\255\255\255\006\001\007\001\008\001\009\001\
\010\001\255\255\012\001\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\009\001\010\001\255\255\
\012\001\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\255\255\255\255\255\255\012\001\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\255\255\255\255\255\255\012\001\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\255\255\
\255\255\255\255\012\001\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\012\001\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\255\255\255\255\255\255\012\001\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\001\001\255\255\003\001\255\255\255\255\006\001\255\255\
\255\255\255\255\255\255\255\255\012\001\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\001\001\
\255\255\003\001\012\001\255\255\006\001\015\001\016\001\255\255\
\255\255\255\255\012\001\021\001\022\001\015\001\016\001\255\255\
\255\255\255\255\255\255\021\001\022\001"

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
  NOT\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  AND\000\
  OR\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  FLOAT\000\
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
  LITERAL\000\
  BLIT\000\
  ID\000\
  FLOATLIT\000\
  STRINGLIT\000\
  CHARLIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 39 "Matcat_Parser.mly"
            ( _1 )
# 430 "Matcat_Parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "Matcat_Parser.mly"
                 ( ([], [])               )
# 436 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 43 "Matcat_Parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 444 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 44 "Matcat_Parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 452 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 6 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : 'types) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 50 "Matcat_Parser.mly"
     ( { 
	 fname = _2;
	 formals = List.rev _4;
	 typs=_6;
	 locals = List.rev _8;
	 body = List.rev _9 } )
# 468 "Matcat_Parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "Matcat_Parser.mly"
                  ( [] )
# 474 "Matcat_Parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 58 "Matcat_Parser.mly"
                  ( _1 )
# 481 "Matcat_Parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "Matcat_Parser.mly"
                             ( [(_1,_2)]     )
# 489 "Matcat_Parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 62 "Matcat_Parser.mly"
                             ( (_3,_4) :: _1 )
# 498 "Matcat_Parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 65 "Matcat_Parser.mly"
                     ((_1))
# 505 "Matcat_Parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'types) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 66 "Matcat_Parser.mly"
                     (_3::_1)
# 513 "Matcat_Parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "Matcat_Parser.mly"
          ( Int   )
# 519 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "Matcat_Parser.mly"
          ( Bool  )
# 525 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "Matcat_Parser.mly"
          ( Float )
# 531 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "Matcat_Parser.mly"
          ( Char  )
# 537 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "Matcat_Parser.mly"
          ( Void  )
# 543 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "Matcat_Parser.mly"
          ( Matrix)
# 549 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "Matcat_Parser.mly"
          ( Vector)
# 555 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "Matcat_Parser.mly"
                     ( [] )
# 561 "Matcat_Parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 79 "Matcat_Parser.mly"
                     ( _2 :: _1 )
# 569 "Matcat_Parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 82 "Matcat_Parser.mly"
               ( (_1, _2) )
# 577 "Matcat_Parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "Matcat_Parser.mly"
                   ( [] )
# 583 "Matcat_Parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 86 "Matcat_Parser.mly"
                   ( _2 :: _1 )
# 591 "Matcat_Parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 89 "Matcat_Parser.mly"
                                            ( Expr _1               )
# 598 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 90 "Matcat_Parser.mly"
                                            ( Return _2             )
# 605 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 92 "Matcat_Parser.mly"
                                            ( Block(List.rev _2)    )
# 612 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 93 "Matcat_Parser.mly"
                                            ( If(_3, _5, Block([])) )
# 620 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 94 "Matcat_Parser.mly"
                                            ( If(_3, _5, _7)        )
# 629 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 96 "Matcat_Parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 639 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 97 "Matcat_Parser.mly"
                                            ( While(_3, _5)         )
# 647 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 100 "Matcat_Parser.mly"
                  ( Noexpr )
# 653 "Matcat_Parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "Matcat_Parser.mly"
                  ( _1 )
# 660 "Matcat_Parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 104 "Matcat_Parser.mly"
                     ( Literal(_1)            )
# 667 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "Matcat_Parser.mly"
                    ( Fliteral(_1)           )
# 674 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 106 "Matcat_Parser.mly"
                     ( BoolLit(_1)            )
# 681 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "Matcat_Parser.mly"
                     ( StringLit(_1)          )
# 688 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 108 "Matcat_Parser.mly"
                     ( CharLit(_1)            )
# 695 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "Matcat_Parser.mly"
                     ( Id(_1)                 )
# 702 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "Matcat_Parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 710 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "Matcat_Parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 718 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "Matcat_Parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 726 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "Matcat_Parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 734 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "Matcat_Parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 742 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "Matcat_Parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 750 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "Matcat_Parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 758 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "Matcat_Parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 766 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "Matcat_Parser.mly"
                     ( Binop(_1, Greater, _3) )
# 774 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "Matcat_Parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 782 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "Matcat_Parser.mly"
                     ( Binop(_1, And,   _3)   )
# 790 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "Matcat_Parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 798 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "Matcat_Parser.mly"
                         ( Unop(Neg, _2)      )
# 805 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "Matcat_Parser.mly"
                     ( Unop(Not, _2)          )
# 812 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "Matcat_Parser.mly"
                     ( Assign(_1, _3)         )
# 820 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 125 "Matcat_Parser.mly"
                              ( Call(_1, _3)  )
# 828 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 126 "Matcat_Parser.mly"
                       ( _2                   )
# 835 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "Matcat_Parser.mly"
                     ( Binop(_1,Cr,_3))
# 843 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "Matcat_Parser.mly"
                     ( Binop(_1,Dot,_3))
# 851 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'matrix_value) in
    Obj.repr(
# 130 "Matcat_Parser.mly"
                       ( MatrixLit(_2))
# 858 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'vector_value) in
    Obj.repr(
# 131 "Matcat_Parser.mly"
                               ( VectorLit(_2))
# 865 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 134 "Matcat_Parser.mly"
                  ( [] )
# 871 "Matcat_Parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 135 "Matcat_Parser.mly"
               ( List.rev _1 )
# 878 "Matcat_Parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "Matcat_Parser.mly"
                            ( [_1] )
# 885 "Matcat_Parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 139 "Matcat_Parser.mly"
                         ( _3 :: _1 )
# 893 "Matcat_Parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 142 "Matcat_Parser.mly"
                            (_1)
# 900 "Matcat_Parser.ml"
               : 'vector_value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'args_list) in
    Obj.repr(
# 149 "Matcat_Parser.mly"
                          ()
# 907 "Matcat_Parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'args_list) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'matrix_value) in
    Obj.repr(
# 150 "Matcat_Parser.mly"
                                              ()
# 915 "Matcat_Parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'matrix_value) in
    Obj.repr(
# 151 "Matcat_Parser.mly"
                                        ()
# 923 "Matcat_Parser.ml"
               : 'matrix_value))
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
