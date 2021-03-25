/* Ocamlyacc parser for Matcat */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA PLUS MINUS TIMES DIVIDE ASSIGN RBRACK LBRACK TRANSPOSE INVERSE
%token STRUCT
%token NOT EQ NEQ LT LEQ GT GEQ AND OR
%token RETURN IF ELSE FOR WHILE INT BOOL DOUBLE CHAR VOID
/* added */
%token CR DOT MATRIX VECTOR FUNC 
%token <int> INTLIT
%token <bool> BLIT
%token <string> ID DOUBLELIT
%token <string> STRINGLIT
%token <char> CHARLIT
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOELSE /* above? */
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%left CR DOT
%right NOT
%left TRANSPOSE INVERSE

%%


program:
  decls EOF { $1 }
  
decls:
   /* nothing */ { ([], [])               }
 | decls vdecl { (($2 :: fst $1), snd $1) }
 | decls fdecl { (fst $1, ($2 :: snd $1)) }

fdecl:
    /* if this is func decl, how do we write that we can return as much var as we want */
	  /* added FUNC, also types which will be what types it returns */
   FUNC ID LPAREN formals_opt RPAREN type_list LBRACE vdecl_list stmt_list RBRACE 
     { { 
	 fname = $2;
	 formals = List.rev $4;
	 data_types = List.rev $6;
	 locals = List.rev $8;
	 body = List.rev $9 } }
formals_opt:
    /* nothing */ { [] }
  | formal_list   { $1 }

formal_list:
    typ ID                   { [($1,$2)]     }
  | formal_list COMMA typ ID { ($3,$4) :: $1 }

/* func sumAndDiff(int one, int two) int, int { */
/* This is for the part that function can return more than one type */
/* either we have 1 type or a lot seperated by comma */
type_list:
    typ              {[($1)]}
  | type_list COMMA typ  {$3::$1}

/* added matrix and vector in types */
typ:
    INT     { Int    }
  | BOOL    { Bool   }
  | DOUBLE  { Double }
  | CHAR    { Char   }
  | VOID    { Void   }	
  | MATRIX  { Matrix }
  | VECTOR  { Vector }


vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   typ ID SEMI { ($1, $2) }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }
  
stmt:
    expr SEMI                               { Expr $1               }
  | RETURN expr_opt SEMI                    { Return $2             }
  /* not sure about this one it seems smth like { }  */
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2)    }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)        }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
                                            { For($3, $5, $7, $9)   }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5)         }
  
expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }  

expr:
    INTLIT          { IntLit($1)            }
  | DOUBLELIT	       { Doubleliteral($1)      }
  | BLIT             { BoolLit($1)            }
  | STRINGLIT        { StringLit($1)          }
  | CHARLIT          { CharLit($1)            }
  | ID               { Id($1)                 }
  | expr PLUS   expr { Binop($1, Add,   $3)   }
  | expr MINUS  expr { Binop($1, Sub,   $3)   }
  | expr TIMES  expr { Binop($1, Mult,  $3)   }
  | expr DIVIDE expr { Binop($1, Div,   $3)   }
  | expr EQ     expr { Binop($1, Equal, $3)   }
  | expr NEQ    expr { Binop($1, Neq,   $3)   }
  | expr LT     expr { Binop($1, Less,  $3)   }
  | expr LEQ    expr { Binop($1, Leq,   $3)   }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3)   }
  | expr AND    expr { Binop($1, And,   $3)   }
  | expr OR     expr { Binop($1, Or,    $3)   }
  | MINUS expr %prec NOT { Unop(Neg, $2)      }
  | NOT expr         { Unop(Not, $2)          }
  | TRANSPOSE expr   { Unop(Transpose, $2)    }
  | INVERSE expr     { Unop(Inverse, $2)      }
  | ID ASSIGN expr   { Assign($1, $3)         }
  | ID LPAREN args_opt RPAREN { Call($1, $3)  }
  | LPAREN expr RPAREN { $2                   }
  /* added */
  // | LBRACK args_opt RBRACK              {SeqLit($2)}
  | expr CR expr     { Binop($1,Cr,$3)        }
  | expr DOT expr    { Binop($1,Dot,$3)       }
  // | LBRACK vector_value SEMI RBRACK { VectorLit($2)}
  // | LT matrix_value SEMI GT         { MatrixLit($2)}
  // | ID LBRACK expr RBRACK { VectorElmFromID($1,$3)}
  // | ID LBRACK expr RBRACK LBRACK expr RBRACK { MatrixElmFromID($1,$3,$6)}
  // | LBRACK vector_value SEMI RBRACK LBRACK expr RBRACK { VectorElm($2,$6)}
  // | LT matrix_value SEMI GT LBRACK expr RBRACK LBRACK expr RBRACK { MatrixElm($2,$6)}   //matrix[x][y]
  /* //Or this:  We will finalize this later.
  | LT matrix_value SEMI GT LBRACK args_opt RBRACK { MatrixElm($2,$6)}                  //matrix[x,y]
  */

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

args_opt_vector:
    { [] }
  | args_list_vector  { List.rev $1 }

args_list_vector:
    expr       { [$1] }
  
args_list:
    expr                    { [$1] }
  | args_list COMMA expr    { $3 :: $1 }

matrix_value:
   args_opt                   { [$1] }
 | matrix_value SEMI args_opt {$3 :: $1}

vector_value:
 args_opt_vector     {[$1]}
