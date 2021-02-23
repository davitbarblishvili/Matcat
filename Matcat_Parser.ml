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

open Parsing;;
let _ = parse_error;;
# 4 "Matcat_Parser.mly"
open ()
# 55 "Matcat_Parser.ml"
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
  280 (* AND *);
  281 (* OR *);
  282 (* RETURN *);
  283 (* IF *);
  284 (* ELSE *);
  285 (* FOR *);
  286 (* WHILE *);
  287 (* INT *);
  288 (* BOOL *);
  289 (* FLOAT *);
  290 (* CHAR *);
  291 (* VOID *);
  292 (* CR *);
  293 (* DOT *);
  294 (* MATRIX *);
  295 (* VECTOR *);
  296 (* FUNC *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  297 (* LITERAL *);
  298 (* BLIT *);
  299 (* ID *);
  300 (* FLOATLIT *);
  301 (* STRINGLIT *);
  302 (* CHARLIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\005\000\005\000\009\000\
\009\000\006\000\006\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\007\000\007\000\003\000\008\000\008\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\013\000\013\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\014\000\014\000\017\000\
\017\000\016\000\015\000\015\000\015\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\010\000\000\000\001\000\002\000\
\004\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\000\000\002\000\003\000\000\000\002\000\002\000\
\003\000\003\000\005\000\007\000\009\000\005\000\000\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000\002\000\002\000\002\000\003\000\004\000\
\003\000\003\000\003\000\003\000\003\000\000\000\001\000\001\000\
\003\000\001\000\003\000\005\000\004\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\070\000\000\000\012\000\013\000\014\000\015\000\
\016\000\017\000\018\000\000\000\001\000\003\000\004\000\000\000\
\000\000\000\000\000\000\021\000\000\000\000\000\000\000\000\000\
\000\000\008\000\000\000\010\000\000\000\019\000\000\000\009\000\
\000\000\011\000\020\000\000\000\000\000\022\000\005\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\033\000\035\000\000\000\034\000\036\000\037\000\023\000\
\000\000\000\000\000\000\051\000\000\000\000\000\000\000\053\000\
\054\000\052\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\057\000\026\000\061\000\000\000\000\000\060\000\
\025\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\058\000\059\000\000\000\000\000\000\000\
\000\000\000\000\056\000\000\000\069\000\000\000\000\000\030\000\
\068\000\000\000\000\000\028\000\000\000\000\000\029\000"

let yydgoto = "\002\000\
\003\000\004\000\014\000\015\000\021\000\027\000\033\000\036\000\
\022\000\016\000\056\000\057\000\070\000\101\000\068\000\062\000\
\063\000"

let yysindex = "\023\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\242\254\000\000\000\000\000\000\017\255\
\064\255\080\255\020\001\000\000\079\255\082\255\054\255\020\001\
\020\001\000\000\089\255\000\000\056\255\000\000\020\001\000\000\
\020\001\000\000\000\000\060\255\002\000\000\000\000\000\002\000\
\002\000\002\000\002\000\002\000\087\255\002\000\106\255\109\255\
\113\255\000\000\000\000\081\255\000\000\000\000\000\000\000\000\
\120\255\071\000\105\255\000\000\137\000\104\255\118\255\000\000\
\000\000\000\000\002\000\114\255\137\000\125\255\002\000\002\000\
\002\000\002\000\002\000\000\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\000\000\000\000\000\000\002\000\027\255\000\000\
\000\000\094\000\132\255\117\000\134\255\118\255\137\000\022\255\
\022\255\034\255\034\255\247\255\247\255\018\255\018\255\018\255\
\018\255\177\000\157\000\000\000\000\000\137\000\007\255\203\255\
\002\000\203\255\000\000\087\255\000\000\131\255\165\255\000\000\
\000\000\203\255\002\000\000\000\157\255\203\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\158\255\000\000\000\000\159\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\150\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\152\255\000\000\000\000\
\000\000\000\000\000\000\048\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\009\255\000\000\156\255\000\000\
\000\000\000\000\000\000\000\000\095\255\000\000\000\000\152\255\
\000\000\166\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\168\255\111\255\250\000\
\019\001\200\000\225\000\144\001\148\001\044\001\069\001\094\001\
\119\001\152\001\066\255\000\000\000\000\073\255\160\255\000\000\
\000\000\000\000\000\000\000\000\000\000\195\255\000\000\000\000\
\000\000\000\000\175\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\148\000\000\000\000\000\000\000\000\000\160\000\
\000\000\248\255\144\255\219\255\186\255\000\000\151\255\000\000\
\245\255"

let yytablesize = 689
let yytable = "\058\000\
\013\000\099\000\060\000\061\000\064\000\065\000\066\000\126\000\
\069\000\128\000\023\000\064\000\124\000\125\000\064\000\028\000\
\029\000\132\000\129\000\067\000\064\000\135\000\034\000\001\000\
\077\000\078\000\079\000\080\000\017\000\061\000\079\000\080\000\
\094\000\098\000\069\000\100\000\061\000\103\000\119\000\104\000\
\105\000\106\000\107\000\108\000\109\000\110\000\111\000\112\000\
\113\000\114\000\115\000\116\000\117\000\089\000\090\000\095\000\
\118\000\089\000\090\000\018\000\133\000\037\000\102\000\038\000\
\039\000\019\000\050\000\040\000\050\000\089\000\090\000\050\000\
\041\000\042\000\043\000\065\000\044\000\050\000\065\000\045\000\
\020\000\024\000\074\000\127\000\065\000\046\000\047\000\025\000\
\048\000\049\000\050\000\075\000\030\000\069\000\031\000\032\000\
\026\000\032\000\032\000\067\000\050\000\051\000\052\000\053\000\
\054\000\055\000\037\000\071\000\038\000\092\000\072\000\055\000\
\040\000\055\000\073\000\093\000\055\000\041\000\042\000\043\000\
\076\000\044\000\055\000\094\000\045\000\097\000\077\000\078\000\
\079\000\080\000\046\000\047\000\121\000\048\000\049\000\096\000\
\123\000\081\000\082\000\083\000\084\000\085\000\086\000\087\000\
\088\000\050\000\051\000\052\000\053\000\054\000\055\000\022\000\
\031\000\022\000\022\000\089\000\090\000\022\000\130\000\134\000\
\006\000\007\000\022\000\022\000\022\000\131\000\022\000\066\000\
\062\000\022\000\063\000\077\000\078\000\079\000\080\000\022\000\
\022\000\031\000\022\000\022\000\035\000\067\000\081\000\082\000\
\083\000\084\000\085\000\086\000\087\000\088\000\022\000\022\000\
\022\000\022\000\022\000\022\000\027\000\059\000\027\000\027\000\
\089\000\090\000\027\000\000\000\037\000\000\000\038\000\027\000\
\027\000\027\000\040\000\027\000\000\000\000\000\027\000\041\000\
\042\000\043\000\000\000\044\000\027\000\027\000\045\000\027\000\
\027\000\000\000\000\000\000\000\046\000\047\000\000\000\048\000\
\049\000\000\000\000\000\027\000\027\000\027\000\027\000\027\000\
\027\000\000\000\000\000\050\000\051\000\052\000\053\000\054\000\
\055\000\000\000\000\000\000\000\000\000\077\000\078\000\079\000\
\080\000\000\000\000\000\037\000\000\000\000\000\000\000\000\000\
\000\000\040\000\083\000\084\000\085\000\086\000\041\000\042\000\
\043\000\000\000\044\000\000\000\000\000\045\000\000\000\000\000\
\000\000\000\000\089\000\090\000\000\000\000\000\000\000\005\000\
\006\000\007\000\008\000\009\000\000\000\000\000\010\000\011\000\
\012\000\000\000\050\000\051\000\052\000\053\000\054\000\055\000\
\038\000\000\000\038\000\000\000\000\000\038\000\038\000\038\000\
\038\000\038\000\000\000\038\000\000\000\000\000\000\000\000\000\
\000\000\038\000\038\000\038\000\038\000\038\000\038\000\038\000\
\038\000\091\000\000\000\000\000\000\000\077\000\078\000\079\000\
\080\000\000\000\000\000\038\000\038\000\000\000\000\000\000\000\
\081\000\082\000\083\000\084\000\085\000\086\000\087\000\088\000\
\120\000\000\000\000\000\000\000\077\000\078\000\079\000\080\000\
\000\000\000\000\089\000\090\000\000\000\000\000\000\000\081\000\
\082\000\083\000\084\000\085\000\086\000\087\000\088\000\122\000\
\000\000\000\000\000\000\077\000\078\000\079\000\080\000\000\000\
\000\000\089\000\090\000\000\000\000\000\000\000\081\000\082\000\
\083\000\084\000\085\000\086\000\087\000\088\000\000\000\077\000\
\078\000\079\000\080\000\000\000\000\000\000\000\000\000\000\000\
\089\000\090\000\081\000\082\000\083\000\084\000\085\000\086\000\
\087\000\088\000\000\000\077\000\078\000\079\000\080\000\000\000\
\000\000\000\000\000\000\000\000\089\000\090\000\081\000\082\000\
\083\000\084\000\085\000\086\000\087\000\000\000\000\000\077\000\
\078\000\079\000\080\000\000\000\000\000\000\000\000\000\000\000\
\089\000\090\000\081\000\082\000\083\000\084\000\085\000\086\000\
\041\000\000\000\041\000\000\000\000\000\041\000\041\000\041\000\
\041\000\041\000\000\000\041\000\089\000\090\000\000\000\000\000\
\000\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
\041\000\042\000\000\000\042\000\000\000\000\000\042\000\042\000\
\042\000\042\000\042\000\000\000\042\000\000\000\000\000\000\000\
\000\000\000\000\042\000\042\000\042\000\042\000\042\000\042\000\
\042\000\042\000\039\000\000\000\039\000\000\000\000\000\039\000\
\039\000\039\000\000\000\000\000\000\000\039\000\000\000\000\000\
\000\000\000\000\000\000\039\000\039\000\039\000\039\000\039\000\
\039\000\039\000\039\000\040\000\000\000\040\000\000\000\000\000\
\040\000\040\000\040\000\000\000\000\000\000\000\040\000\000\000\
\000\000\000\000\000\000\000\000\040\000\040\000\040\000\040\000\
\040\000\040\000\040\000\040\000\045\000\000\000\045\000\000\000\
\000\000\045\000\005\000\006\000\007\000\008\000\009\000\045\000\
\000\000\010\000\011\000\000\000\000\000\045\000\045\000\045\000\
\045\000\045\000\045\000\045\000\045\000\046\000\000\000\046\000\
\000\000\000\000\046\000\000\000\000\000\000\000\000\000\000\000\
\046\000\000\000\000\000\000\000\000\000\000\000\046\000\046\000\
\046\000\046\000\046\000\046\000\046\000\046\000\047\000\000\000\
\047\000\000\000\000\000\047\000\000\000\000\000\000\000\000\000\
\000\000\047\000\000\000\000\000\000\000\000\000\000\000\047\000\
\047\000\047\000\047\000\047\000\047\000\047\000\047\000\048\000\
\000\000\048\000\000\000\000\000\048\000\000\000\000\000\000\000\
\000\000\000\000\048\000\000\000\000\000\000\000\000\000\000\000\
\048\000\048\000\048\000\048\000\048\000\048\000\048\000\048\000\
\043\000\000\000\043\000\000\000\044\000\043\000\044\000\000\000\
\049\000\044\000\049\000\043\000\000\000\049\000\000\000\044\000\
\000\000\043\000\043\000\049\000\000\000\044\000\044\000\043\000\
\043\000\000\000\000\000\044\000\044\000\000\000\000\000\049\000\
\049\000"

let yycheck = "\037\000\
\000\000\072\000\040\000\041\000\042\000\043\000\044\000\120\000\
\046\000\122\000\019\000\003\001\006\001\119\000\006\001\024\000\
\025\000\130\000\124\000\013\001\012\001\134\000\031\000\001\000\
\007\001\008\001\009\001\010\001\043\001\067\000\009\001\010\001\
\006\001\071\000\072\000\073\000\074\000\075\000\012\001\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\084\000\085\000\
\086\000\087\000\088\000\089\000\090\000\036\001\037\001\067\000\
\094\000\036\001\037\001\043\001\131\000\002\001\074\000\004\001\
\005\001\002\001\001\001\008\001\003\001\036\001\037\001\006\001\
\013\001\014\001\015\001\003\001\017\001\012\001\006\001\020\001\
\001\001\003\001\002\001\121\000\012\001\026\001\027\001\006\001\
\029\001\030\001\025\001\011\001\004\001\131\000\006\001\001\001\
\043\001\003\001\043\001\013\001\041\001\042\001\043\001\044\001\
\045\001\046\001\002\001\002\001\004\001\005\001\002\001\001\001\
\008\001\003\001\002\001\012\001\006\001\013\001\014\001\015\001\
\001\001\017\001\012\001\006\001\020\001\001\001\007\001\008\001\
\009\001\010\001\026\001\027\001\001\001\029\001\030\001\022\001\
\003\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\041\001\042\001\043\001\044\001\045\001\046\001\002\001\
\001\001\004\001\005\001\036\001\037\001\008\001\028\001\003\001\
\003\001\003\001\013\001\014\001\015\001\001\001\017\001\012\001\
\003\001\020\001\003\001\007\001\008\001\009\001\010\001\026\001\
\027\001\003\001\029\001\030\001\033\000\022\001\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\041\001\042\001\
\043\001\044\001\045\001\046\001\002\001\038\000\004\001\005\001\
\036\001\037\001\008\001\255\255\002\001\255\255\004\001\013\001\
\014\001\015\001\008\001\017\001\255\255\255\255\020\001\013\001\
\014\001\015\001\255\255\017\001\026\001\027\001\020\001\029\001\
\030\001\255\255\255\255\255\255\026\001\027\001\255\255\029\001\
\030\001\255\255\255\255\041\001\042\001\043\001\044\001\045\001\
\046\001\255\255\255\255\041\001\042\001\043\001\044\001\045\001\
\046\001\255\255\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\255\255\002\001\255\255\255\255\255\255\255\255\
\255\255\008\001\020\001\021\001\022\001\023\001\013\001\014\001\
\015\001\255\255\017\001\255\255\255\255\020\001\255\255\255\255\
\255\255\255\255\036\001\037\001\255\255\255\255\255\255\031\001\
\032\001\033\001\034\001\035\001\255\255\255\255\038\001\039\001\
\040\001\255\255\041\001\042\001\043\001\044\001\045\001\046\001\
\001\001\255\255\003\001\255\255\255\255\006\001\007\001\008\001\
\009\001\010\001\255\255\012\001\255\255\255\255\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\003\001\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\255\255\036\001\037\001\255\255\255\255\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\003\001\255\255\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\255\255\036\001\037\001\255\255\255\255\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\003\001\
\255\255\255\255\255\255\007\001\008\001\009\001\010\001\255\255\
\255\255\036\001\037\001\255\255\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\255\255\
\036\001\037\001\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\255\255\007\001\008\001\009\001\010\001\255\255\
\255\255\255\255\255\255\255\255\036\001\037\001\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\255\255\
\036\001\037\001\018\001\019\001\020\001\021\001\022\001\023\001\
\001\001\255\255\003\001\255\255\255\255\006\001\007\001\008\001\
\009\001\010\001\255\255\012\001\036\001\037\001\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\009\001\010\001\255\255\012\001\255\255\255\255\255\255\
\255\255\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\001\001\255\255\003\001\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\255\255\012\001\255\255\255\255\
\255\255\255\255\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\255\255\255\255\255\255\012\001\255\255\
\255\255\255\255\255\255\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\001\001\255\255\003\001\255\255\
\255\255\006\001\031\001\032\001\033\001\034\001\035\001\012\001\
\255\255\038\001\039\001\255\255\255\255\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\012\001\255\255\255\255\255\255\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\255\255\255\255\
\255\255\012\001\255\255\255\255\255\255\255\255\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\255\255\
\255\255\255\255\012\001\255\255\255\255\255\255\255\255\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\001\001\255\255\003\001\255\255\001\001\006\001\003\001\255\255\
\001\001\006\001\003\001\012\001\255\255\006\001\255\255\012\001\
\255\255\018\001\019\001\012\001\255\255\018\001\019\001\024\001\
\025\001\255\255\255\255\024\001\025\001\255\255\255\255\024\001\
\025\001"

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
# 41 "Matcat_Parser.mly"
            ( _1 )
# 437 "Matcat_Parser.ml"
               : ().program))
; (fun __caml_parser_env ->
    Obj.repr(
# 44 "Matcat_Parser.mly"
                 ( ([], [])               )
# 443 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 45 "Matcat_Parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 451 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 46 "Matcat_Parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 459 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 6 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : 'types) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 52 "Matcat_Parser.mly"
     ( { 
	 fname = _2;
	 formals = List.rev _4;
	 typs=_6;
	 locals = List.rev _8;
	 body = List.rev _9 } )
# 475 "Matcat_Parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "Matcat_Parser.mly"
                  ( [] )
# 481 "Matcat_Parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 60 "Matcat_Parser.mly"
                  ( _1 )
# 488 "Matcat_Parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "Matcat_Parser.mly"
                             ( [(_1,_2)]     )
# 496 "Matcat_Parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 64 "Matcat_Parser.mly"
                             ( (_3,_4) :: _1 )
# 505 "Matcat_Parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 67 "Matcat_Parser.mly"
                     ((_1))
# 512 "Matcat_Parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'types) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 68 "Matcat_Parser.mly"
                     (_3::_1)
# 520 "Matcat_Parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "Matcat_Parser.mly"
          ( Int   )
# 526 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "Matcat_Parser.mly"
          ( Bool  )
# 532 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "Matcat_Parser.mly"
          ( Float )
# 538 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "Matcat_Parser.mly"
          ( Char  )
# 544 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "Matcat_Parser.mly"
          ( Void  )
# 550 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "Matcat_Parser.mly"
          ( Matrix)
# 556 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "Matcat_Parser.mly"
          ( Vector)
# 562 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "Matcat_Parser.mly"
                     ( [] )
# 568 "Matcat_Parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 81 "Matcat_Parser.mly"
                     ( _2 :: _1 )
# 576 "Matcat_Parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 84 "Matcat_Parser.mly"
               ( (_1, _2) )
# 584 "Matcat_Parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 87 "Matcat_Parser.mly"
                   ( [] )
# 590 "Matcat_Parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 88 "Matcat_Parser.mly"
                   ( _2 :: _1 )
# 598 "Matcat_Parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 91 "Matcat_Parser.mly"
                                            ( Expr _1               )
# 605 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 92 "Matcat_Parser.mly"
                                            ( Return _2             )
# 612 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 94 "Matcat_Parser.mly"
                                            ( Block(List.rev _2)    )
# 619 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 95 "Matcat_Parser.mly"
                                            ( If(_3, _5, Block([])) )
# 627 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 96 "Matcat_Parser.mly"
                                            ( If(_3, _5, _7)        )
# 636 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 98 "Matcat_Parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 646 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 99 "Matcat_Parser.mly"
                                            ( While(_3, _5)         )
# 654 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "Matcat_Parser.mly"
                  ( Noexpr )
# 660 "Matcat_Parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "Matcat_Parser.mly"
                  ( _1 )
# 667 "Matcat_Parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 106 "Matcat_Parser.mly"
                     ( Literal(_1)            )
# 674 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "Matcat_Parser.mly"
                    ( Fliteral(_1)           )
# 681 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 108 "Matcat_Parser.mly"
                     ( BoolLit(_1)            )
# 688 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "Matcat_Parser.mly"
                     ( StringLit(_1)          )
# 695 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 110 "Matcat_Parser.mly"
                     ( CharLit(_1)            )
# 702 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "Matcat_Parser.mly"
                     ( Id(_1)                 )
# 709 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "Matcat_Parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 717 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "Matcat_Parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 725 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "Matcat_Parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 733 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "Matcat_Parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 741 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "Matcat_Parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 749 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "Matcat_Parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 757 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "Matcat_Parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 765 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "Matcat_Parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 773 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "Matcat_Parser.mly"
                     ( Binop(_1, Greater, _3) )
# 781 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "Matcat_Parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 789 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "Matcat_Parser.mly"
                     ( Binop(_1, And,   _3)   )
# 797 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "Matcat_Parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 805 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "Matcat_Parser.mly"
                         ( Unop(Neg, _2)      )
# 812 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "Matcat_Parser.mly"
                     ( Unop(Not, _2)          )
# 819 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "Matcat_Parser.mly"
                     ( Unop(Transpose, _2)    )
# 826 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "Matcat_Parser.mly"
                     ( Unop(Inverse, _2)      )
# 833 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "Matcat_Parser.mly"
                     ( Assign(_1, _3)         )
# 841 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 129 "Matcat_Parser.mly"
                              ( Call(_1, _3)  )
# 849 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 130 "Matcat_Parser.mly"
                       ( _2                   )
# 856 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "Matcat_Parser.mly"
                     ( Binop(_1,Cr,_3))
# 864 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "Matcat_Parser.mly"
                     ( Binop(_1,Dot,_3))
# 872 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'matrix_value) in
    Obj.repr(
# 134 "Matcat_Parser.mly"
                       ( MatrixLit(_2))
# 879 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'vector_value) in
    Obj.repr(
# 135 "Matcat_Parser.mly"
                               ( VectorLit(_2))
# 886 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "Matcat_Parser.mly"
                  ( [] )
# 892 "Matcat_Parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 139 "Matcat_Parser.mly"
               ( List.rev _1 )
# 899 "Matcat_Parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "Matcat_Parser.mly"
                            ( [_1] )
# 906 "Matcat_Parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "Matcat_Parser.mly"
                         ( _3 :: _1 )
# 914 "Matcat_Parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 146 "Matcat_Parser.mly"
                            (_1)
# 921 "Matcat_Parser.ml"
               : 'vector_value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'args_list) in
    Obj.repr(
# 153 "Matcat_Parser.mly"
                           ()
# 928 "Matcat_Parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'args_list) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'matrix_value) in
    Obj.repr(
# 154 "Matcat_Parser.mly"
                                              ()
# 936 "Matcat_Parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'matrix_value) in
    Obj.repr(
# 155 "Matcat_Parser.mly"
                                        ()
# 944 "Matcat_Parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : ().program)
