/* Ocamlyacc parser for Matcat */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA PLUS MINUS TIMES DIVIDE ASSIGN RBRACK LBRACK
%token STRUCT
%token NOT EQ NEQ LT LEQ GT GEQ TRUE FALSE AND OR
%token RETURN IF ELSE FOR WHILE INT STRING BOOL DOUBLE CHAR VOID
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
%left

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
   FUNC ID LPAREN formals_opt RPAREN typ LBRACE vdecl_list stmt_list RBRACE 
     { { 
	 fname = $2;
	 formals = List.rev $4;
	 data_type =$6;
	 locals = List.rev $8;
	 body = List.rev $9 } }
formals_opt:
    /* nothing */ { [] }
  | formal_list   { $1 }

formal_list:
    typ ID                   { [($1,$2,Noexpr)]     }
  | formal_list COMMA typ ID { ($3,$4,Noexpr) :: $1 }

/* added matrix and vector in types */
typ:
    INT     { Int    }
  | BOOL    { Bool   }
  | DOUBLE  { Double }
  | CHAR    { Char   }
  | VOID    { Void   }	
  | MATRIX  { Matrix }
  | VECTOR  { Vector }
  | STRING  { String }


vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   typ ID SEMI { ($1, $2, Noexpr) }
  |typ ID ASSIGN expr SEMI { ($1, $2, Assign($2,$4))}

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
  | DOUBLELIT	       { DoubleLit($1)      }
  | BLIT             { BoolLit($1)            }
  | STRINGLIT        { StringLit($1)          }
  | TRUE             { BoolLit(true)          }
  | FALSE            { BoolLit(false)         }
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
  | ID ASSIGN expr   { Assign($1, $3)         }
  | ID LPAREN args_opt RPAREN { Call($1, $3)  }
  | LPAREN expr RPAREN { $2                   }
  /* added */
  // | LBRACK args_opt RBRACK              {SeqLit($2)}
  | expr CR expr     { Binop($1,Cr,$3)        }
  | expr DOT expr    { Binop($1,Dot,$3)       }
  // | LBRACK vector_value SEMI RBRACK { VectorLit($2)}
   | LBRACK matrix_value RBRACK        { MatrixLit($2)}
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

  
args_list:
    expr                    { [$1] }
  | args_list COMMA expr    { $3 :: $1 }

matrix_value:
  LBRACK args_opt RBRACK                   { [MatrixLit(List.rev $2)] }
| LBRACK args_opt RBRACK COMMA matrix_value { MatrixLit(List.rev $2)::$5 }
| LBRACK args_opt RBRACK matrix_value       { MatrixLit(List.rev $2)::$4 }

