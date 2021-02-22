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
\015\000\015\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\010\000\000\000\001\000\002\000\
\004\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\000\000\002\000\003\000\000\000\002\000\002\000\
\003\000\003\000\005\000\007\000\009\000\005\000\000\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000\002\000\003\000\004\000\003\000\003\000\
\003\000\003\000\003\000\000\000\001\000\001\000\003\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\067\000\000\000\012\000\013\000\014\000\015\000\
\016\000\017\000\018\000\000\000\001\000\003\000\004\000\000\000\
\000\000\000\000\000\000\021\000\000\000\000\000\000\000\000\000\
\000\000\008\000\000\000\010\000\000\000\019\000\000\000\009\000\
\000\000\011\000\020\000\000\000\000\000\022\000\005\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\033\000\035\000\
\000\000\034\000\036\000\037\000\023\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\024\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\055\000\026\000\058\000\059\000\
\000\000\000\000\025\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\056\000\057\000\066\000\
\000\000\000\000\000\000\000\000\000\000\054\000\000\000\000\000\
\030\000\000\000\000\000\028\000\000\000\000\000\029\000"

let yydgoto = "\002\000\
\003\000\004\000\014\000\015\000\021\000\027\000\033\000\036\000\
\022\000\016\000\053\000\054\000\064\000\095\000\059\000\060\000\
\061\000"

let yysindex = "\017\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\237\254\000\000\000\000\000\000\024\255\
\063\255\056\255\158\001\000\000\065\255\064\255\029\255\158\001\
\158\001\000\000\013\255\000\000\033\255\000\000\158\001\000\000\
\158\001\000\000\000\000\058\255\198\255\000\000\000\000\198\255\
\198\255\198\255\198\255\072\255\073\255\085\255\000\000\000\000\
\005\255\000\000\000\000\000\000\000\000\241\255\053\000\100\255\
\021\255\113\000\076\255\078\255\009\255\021\255\113\000\090\255\
\198\255\198\255\198\255\198\255\198\255\000\000\198\255\198\255\
\198\255\198\255\198\255\198\255\198\255\198\255\198\255\198\255\
\198\255\198\255\198\255\198\255\000\000\000\000\000\000\000\000\
\198\255\198\255\000\000\073\000\091\255\093\000\092\255\087\255\
\113\000\017\255\017\255\021\255\021\255\171\000\171\000\015\255\
\015\255\015\255\015\255\153\000\133\000\000\000\000\000\000\000\
\009\255\113\000\156\255\198\255\156\255\000\000\069\255\033\000\
\000\000\156\255\198\255\000\000\103\255\156\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\104\255\000\000\000\000\113\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\107\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\102\255\000\000\000\000\000\000\000\000\000\000\
\212\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\191\000\077\255\000\000\000\000\098\255\213\000\008\255\000\000\
\000\000\102\255\000\000\115\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\122\255\
\116\255\023\001\045\001\235\000\001\001\155\001\163\001\067\001\
\089\001\111\001\133\001\055\255\204\255\000\000\000\000\000\000\
\117\255\165\255\000\000\000\000\000\000\000\000\149\255\000\000\
\000\000\000\000\129\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\102\000\000\000\000\000\000\000\000\000\098\000\
\000\000\245\255\150\000\219\255\192\255\000\000\048\000\000\000\
\200\255"

let yytablesize = 706
let yytable = "\055\000\
\013\000\093\000\057\000\058\000\062\000\063\000\068\000\023\000\
\032\000\089\000\032\000\096\000\028\000\029\000\090\000\069\000\
\030\000\001\000\031\000\034\000\017\000\071\000\072\000\073\000\
\074\000\073\000\074\000\092\000\063\000\094\000\058\000\097\000\
\113\000\098\000\099\000\100\000\101\000\102\000\103\000\104\000\
\105\000\106\000\107\000\108\000\109\000\110\000\111\000\083\000\
\084\000\083\000\084\000\058\000\114\000\083\000\084\000\049\000\
\020\000\049\000\125\000\037\000\049\000\038\000\039\000\018\000\
\019\000\040\000\049\000\024\000\026\000\025\000\041\000\042\000\
\032\000\065\000\066\000\049\000\049\000\062\000\120\000\062\000\
\043\000\044\000\062\000\045\000\046\000\063\000\067\000\087\000\
\062\000\088\000\091\000\116\000\090\000\122\000\118\000\047\000\
\048\000\049\000\050\000\051\000\052\000\037\000\031\000\038\000\
\086\000\126\000\006\000\040\000\022\000\064\000\022\000\022\000\
\041\000\042\000\022\000\007\000\053\000\060\000\053\000\022\000\
\022\000\053\000\043\000\044\000\061\000\045\000\046\000\053\000\
\065\000\022\000\022\000\031\000\022\000\022\000\035\000\056\000\
\112\000\047\000\048\000\049\000\050\000\051\000\052\000\000\000\
\022\000\022\000\022\000\022\000\022\000\022\000\027\000\000\000\
\027\000\027\000\000\000\000\000\027\000\037\000\000\000\038\000\
\000\000\027\000\027\000\040\000\000\000\063\000\000\000\063\000\
\041\000\042\000\063\000\027\000\027\000\000\000\027\000\027\000\
\063\000\000\000\043\000\044\000\000\000\045\000\046\000\000\000\
\000\000\000\000\027\000\027\000\027\000\027\000\027\000\027\000\
\000\000\047\000\048\000\049\000\050\000\051\000\052\000\037\000\
\000\000\000\000\000\000\000\000\050\000\040\000\050\000\000\000\
\000\000\050\000\041\000\042\000\038\000\000\000\038\000\050\000\
\000\000\038\000\038\000\038\000\038\000\038\000\000\000\038\000\
\000\000\050\000\038\000\038\000\038\000\038\000\038\000\038\000\
\038\000\038\000\000\000\047\000\048\000\049\000\050\000\051\000\
\052\000\070\000\000\000\000\000\038\000\038\000\000\000\071\000\
\072\000\073\000\074\000\000\000\000\000\000\000\000\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\000\000\
\119\000\000\000\121\000\000\000\000\000\000\000\000\000\124\000\
\000\000\083\000\084\000\127\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\005\000\006\000\007\000\008\000\
\009\000\123\000\000\000\010\000\011\000\012\000\000\000\071\000\
\072\000\073\000\074\000\000\000\000\000\000\000\000\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\085\000\
\000\000\000\000\000\000\071\000\072\000\073\000\074\000\000\000\
\000\000\083\000\084\000\075\000\076\000\077\000\078\000\079\000\
\080\000\081\000\082\000\115\000\000\000\000\000\000\000\071\000\
\072\000\073\000\074\000\000\000\000\000\083\000\084\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\117\000\
\000\000\000\000\000\000\071\000\072\000\073\000\074\000\000\000\
\000\000\083\000\084\000\075\000\076\000\077\000\078\000\079\000\
\080\000\081\000\082\000\000\000\000\000\000\000\000\000\071\000\
\072\000\073\000\074\000\000\000\000\000\083\000\084\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\000\000\
\000\000\000\000\000\000\071\000\072\000\073\000\074\000\000\000\
\000\000\083\000\084\000\075\000\076\000\077\000\078\000\079\000\
\080\000\081\000\000\000\000\000\000\000\000\000\000\000\071\000\
\072\000\073\000\074\000\000\000\000\000\083\000\084\000\075\000\
\076\000\077\000\078\000\079\000\080\000\000\000\000\000\000\000\
\000\000\071\000\072\000\073\000\074\000\000\000\000\000\000\000\
\000\000\083\000\084\000\077\000\078\000\079\000\080\000\051\000\
\000\000\051\000\000\000\000\000\051\000\051\000\051\000\051\000\
\051\000\000\000\051\000\083\000\084\000\051\000\051\000\051\000\
\051\000\051\000\051\000\051\000\051\000\052\000\000\000\052\000\
\000\000\000\000\052\000\052\000\052\000\052\000\052\000\000\000\
\052\000\000\000\000\000\052\000\052\000\052\000\052\000\052\000\
\052\000\052\000\052\000\041\000\000\000\041\000\000\000\000\000\
\041\000\041\000\041\000\041\000\041\000\000\000\041\000\000\000\
\000\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
\041\000\042\000\000\000\042\000\000\000\000\000\042\000\042\000\
\042\000\042\000\042\000\000\000\042\000\000\000\000\000\042\000\
\042\000\042\000\042\000\042\000\042\000\042\000\042\000\039\000\
\000\000\039\000\000\000\000\000\039\000\039\000\039\000\000\000\
\000\000\000\000\039\000\000\000\000\000\039\000\039\000\039\000\
\039\000\039\000\039\000\039\000\039\000\040\000\000\000\040\000\
\000\000\000\000\040\000\040\000\040\000\000\000\000\000\000\000\
\040\000\000\000\000\000\040\000\040\000\040\000\040\000\040\000\
\040\000\040\000\040\000\045\000\000\000\045\000\000\000\000\000\
\045\000\000\000\000\000\000\000\000\000\000\000\045\000\000\000\
\000\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
\045\000\046\000\000\000\046\000\000\000\000\000\046\000\000\000\
\000\000\000\000\000\000\000\000\046\000\000\000\000\000\046\000\
\046\000\046\000\046\000\046\000\046\000\046\000\046\000\047\000\
\000\000\047\000\000\000\000\000\047\000\000\000\000\000\000\000\
\000\000\000\000\047\000\000\000\000\000\047\000\047\000\047\000\
\047\000\047\000\047\000\047\000\047\000\048\000\000\000\048\000\
\000\000\000\000\048\000\000\000\000\000\000\000\000\000\000\000\
\048\000\000\000\000\000\048\000\048\000\048\000\048\000\048\000\
\048\000\048\000\048\000\043\000\000\000\043\000\000\000\000\000\
\043\000\000\000\000\000\044\000\000\000\044\000\043\000\000\000\
\044\000\043\000\043\000\000\000\000\000\000\000\044\000\043\000\
\043\000\044\000\044\000\000\000\000\000\000\000\000\000\044\000\
\044\000\005\000\006\000\007\000\008\000\009\000\000\000\000\000\
\010\000\011\000"

let yycheck = "\037\000\
\000\000\066\000\040\000\041\000\042\000\043\000\002\001\019\000\
\001\001\001\001\003\001\068\000\024\000\025\000\006\001\011\001\
\004\001\001\000\006\001\031\000\040\001\007\001\008\001\009\001\
\010\001\009\001\010\001\065\000\066\000\067\000\068\000\069\000\
\089\000\071\000\072\000\073\000\074\000\075\000\076\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\084\000\033\001\
\034\001\033\001\034\001\089\000\090\000\033\001\034\001\001\001\
\001\001\003\001\123\000\002\001\006\001\004\001\005\001\040\001\
\002\001\008\001\012\001\003\001\040\001\006\001\013\001\014\001\
\040\001\002\001\002\001\021\001\022\001\001\001\116\000\003\001\
\023\001\024\001\006\001\026\001\027\001\123\000\002\001\012\001\
\012\001\012\001\001\001\001\001\006\001\025\001\003\001\038\001\
\039\001\040\001\041\001\042\001\043\001\002\001\001\001\004\001\
\005\001\003\001\003\001\008\001\002\001\012\001\004\001\005\001\
\013\001\014\001\008\001\003\001\001\001\003\001\003\001\013\001\
\014\001\006\001\023\001\024\001\003\001\026\001\027\001\012\001\
\012\001\023\001\024\001\003\001\026\001\027\001\033\000\038\000\
\089\000\038\001\039\001\040\001\041\001\042\001\043\001\255\255\
\038\001\039\001\040\001\041\001\042\001\043\001\002\001\255\255\
\004\001\005\001\255\255\255\255\008\001\002\001\255\255\004\001\
\255\255\013\001\014\001\008\001\255\255\001\001\255\255\003\001\
\013\001\014\001\006\001\023\001\024\001\255\255\026\001\027\001\
\012\001\255\255\023\001\024\001\255\255\026\001\027\001\255\255\
\255\255\255\255\038\001\039\001\040\001\041\001\042\001\043\001\
\255\255\038\001\039\001\040\001\041\001\042\001\043\001\002\001\
\255\255\255\255\255\255\255\255\001\001\008\001\003\001\255\255\
\255\255\006\001\013\001\014\001\001\001\255\255\003\001\012\001\
\255\255\006\001\007\001\008\001\009\001\010\001\255\255\012\001\
\255\255\022\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\038\001\039\001\040\001\041\001\042\001\
\043\001\001\001\255\255\255\255\033\001\034\001\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\255\255\
\115\000\255\255\117\000\255\255\255\255\255\255\255\255\122\000\
\255\255\033\001\034\001\126\000\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\028\001\029\001\030\001\031\001\
\032\001\001\001\255\255\035\001\036\001\037\001\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\003\001\
\255\255\255\255\255\255\007\001\008\001\009\001\010\001\255\255\
\255\255\033\001\034\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\003\001\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\033\001\034\001\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\003\001\
\255\255\255\255\255\255\007\001\008\001\009\001\010\001\255\255\
\255\255\033\001\034\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\255\255\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\033\001\034\001\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\255\255\
\255\255\255\255\255\255\007\001\008\001\009\001\010\001\255\255\
\255\255\033\001\034\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\255\255\255\255\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\033\001\034\001\015\001\
\016\001\017\001\018\001\019\001\020\001\255\255\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\255\255\255\255\
\255\255\033\001\034\001\017\001\018\001\019\001\020\001\001\001\
\255\255\003\001\255\255\255\255\006\001\007\001\008\001\009\001\
\010\001\255\255\012\001\033\001\034\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\009\001\010\001\255\255\
\012\001\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\009\001\010\001\255\255\012\001\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\009\001\010\001\255\255\012\001\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\001\
\255\255\003\001\255\255\255\255\006\001\007\001\008\001\255\255\
\255\255\255\255\012\001\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\255\255\
\012\001\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\255\255\255\255\255\255\012\001\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\001\001\255\255\003\001\255\255\255\255\006\001\255\255\
\255\255\255\255\255\255\255\255\012\001\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\255\255\
\255\255\255\255\012\001\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\012\001\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\001\001\255\255\003\001\012\001\255\255\
\006\001\015\001\016\001\255\255\255\255\255\255\012\001\021\001\
\022\001\015\001\016\001\255\255\255\255\255\255\255\255\021\001\
\022\001\028\001\029\001\030\001\031\001\032\001\255\255\255\255\
\035\001\036\001"

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
# 429 "Matcat_Parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "Matcat_Parser.mly"
                 ( ([], [])               )
# 435 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 43 "Matcat_Parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 443 "Matcat_Parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 44 "Matcat_Parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 451 "Matcat_Parser.ml"
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
# 467 "Matcat_Parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "Matcat_Parser.mly"
                  ( [] )
# 473 "Matcat_Parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 58 "Matcat_Parser.mly"
                  ( _1 )
# 480 "Matcat_Parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "Matcat_Parser.mly"
                             ( [(_1,_2)]     )
# 488 "Matcat_Parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 62 "Matcat_Parser.mly"
                             ( (_3,_4) :: _1 )
# 497 "Matcat_Parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 65 "Matcat_Parser.mly"
                     ((_1))
# 504 "Matcat_Parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'types) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 66 "Matcat_Parser.mly"
                     (_3::_1)
# 512 "Matcat_Parser.ml"
               : 'types))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "Matcat_Parser.mly"
          ( Int   )
# 518 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "Matcat_Parser.mly"
          ( Bool  )
# 524 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "Matcat_Parser.mly"
          ( Float )
# 530 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "Matcat_Parser.mly"
          ( Char  )
# 536 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "Matcat_Parser.mly"
          ( Void  )
# 542 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "Matcat_Parser.mly"
          ( Matrix)
# 548 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "Matcat_Parser.mly"
          ( Vector)
# 554 "Matcat_Parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "Matcat_Parser.mly"
                     ( [] )
# 560 "Matcat_Parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 79 "Matcat_Parser.mly"
                     ( _2 :: _1 )
# 568 "Matcat_Parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 82 "Matcat_Parser.mly"
               ( (_1, _2) )
# 576 "Matcat_Parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "Matcat_Parser.mly"
                   ( [] )
# 582 "Matcat_Parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 86 "Matcat_Parser.mly"
                   ( _2 :: _1 )
# 590 "Matcat_Parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 89 "Matcat_Parser.mly"
                                            ( Expr _1               )
# 597 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 90 "Matcat_Parser.mly"
                                            ( Return _2             )
# 604 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 92 "Matcat_Parser.mly"
                                            ( Block(List.rev _2)    )
# 611 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 93 "Matcat_Parser.mly"
                                            ( If(_3, _5, Block([])) )
# 619 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 94 "Matcat_Parser.mly"
                                            ( If(_3, _5, _7)        )
# 628 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 96 "Matcat_Parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 638 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 97 "Matcat_Parser.mly"
                                            ( While(_3, _5)         )
# 646 "Matcat_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 100 "Matcat_Parser.mly"
                  ( Noexpr )
# 652 "Matcat_Parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "Matcat_Parser.mly"
                  ( _1 )
# 659 "Matcat_Parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 104 "Matcat_Parser.mly"
                     ( Literal(_1)            )
# 666 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "Matcat_Parser.mly"
                    ( Fliteral(_1)           )
# 673 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 106 "Matcat_Parser.mly"
                     ( BoolLit(_1)            )
# 680 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "Matcat_Parser.mly"
                     ( StringLit(_1)          )
# 687 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 108 "Matcat_Parser.mly"
                     ( CharLit(_1)            )
# 694 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "Matcat_Parser.mly"
                     ( Id(_1)                 )
# 701 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "Matcat_Parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 709 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "Matcat_Parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 717 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "Matcat_Parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 725 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "Matcat_Parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 733 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "Matcat_Parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 741 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "Matcat_Parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 749 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "Matcat_Parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 757 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "Matcat_Parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 765 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "Matcat_Parser.mly"
                     ( Binop(_1, Greater, _3) )
# 773 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "Matcat_Parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 781 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "Matcat_Parser.mly"
                     ( Binop(_1, And,   _3)   )
# 789 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "Matcat_Parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 797 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "Matcat_Parser.mly"
                         ( Unop(Neg, _2)      )
# 804 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "Matcat_Parser.mly"
                     ( Unop(Not, _2)          )
# 811 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "Matcat_Parser.mly"
                     ( Assign(_1, _3)         )
# 819 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 125 "Matcat_Parser.mly"
                              ( Call(_1, _3)  )
# 827 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 126 "Matcat_Parser.mly"
                       ( _2                   )
# 834 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "Matcat_Parser.mly"
                     ( Binop(_1,Cr,_3))
# 842 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "Matcat_Parser.mly"
                     ( Binop(_1,Dot,_3))
# 850 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'matrix_value) in
    Obj.repr(
# 130 "Matcat_Parser.mly"
                               ( MatrixLit(_2))
# 857 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'vector_value) in
    Obj.repr(
# 131 "Matcat_Parser.mly"
                               ( VectorLit(_2))
# 864 "Matcat_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 134 "Matcat_Parser.mly"
                  ( [] )
# 870 "Matcat_Parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 135 "Matcat_Parser.mly"
               ( List.rev _1 )
# 877 "Matcat_Parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "Matcat_Parser.mly"
                            ( [_1] )
# 884 "Matcat_Parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 139 "Matcat_Parser.mly"
                         ( _3 :: _1 )
# 892 "Matcat_Parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 142 "Matcat_Parser.mly"
                            (_1)
# 899 "Matcat_Parser.ml"
               : 'vector_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 145 "Matcat_Parser.mly"
                            (_1)
# 906 "Matcat_Parser.ml"
               : 'matrix_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'matrix_value) in
    Obj.repr(
# 146 "Matcat_Parser.mly"
                                (())
# 914 "Matcat_Parser.ml"
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
