/* Ocamlyacc parser for Matcat */

%{
open Ast
%}


%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA PLUS MINUS TIMES DIVIDE ASSIGN RBRACK LBRACK COLON CIRCU
%token STRUCT
%token NOT EQ NEQ LT LEQ GT GEQ TRUE FALSE AND OR
%token RETURN IF ELSE FOR WHILE INT STRING BOOL DOUBLE VOID
/* added */
%token CR DOT MATRIX FUNC 
%token <int> INTLIT
%token <bool> BLIT
%token <string> ID DOUBLELIT
%token <string> STRINGLIT
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
%right CIRCU
%left

%%


program:
  decls EOF { $1 }

decls:
   /* nothing */ { ([], []) }
  | decls global  { (($2 :: fst $1), snd $1) }
  | decls fdecl   { (fst $1, ($2 :: snd $1)) }

 global:
    typ ID SEMI         { (($1,$2),Noexpr) }

fdecl:
   FUNC ID LPAREN formals_opt RPAREN typ LBRACE stmt_list RBRACE 
     { { 
	 fname = $2;
	 formals = List.rev $4;
	 data_type =$6;
	 locals = [];
	 body = List.rev $8 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { $1 }

formal_list:
    typ ID                   { [($1,$2)]     }
  | formal_list COMMA typ ID { ($3,$4) :: $1 }

/* added matrix in types */
typ:
    INT     { Int    }
  | BOOL    { Bool   }
  | DOUBLE  { Double }
  | VOID    { Void   }	
  | MATRIX  { Matrix }
  | STRING  { String }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }
  
stmt:
    expr SEMI                               { Expr $1                     }
  | RETURN expr_opt SEMI                    { Return $2                   }
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2)          }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([]))       }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)              }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
                                            { For($3, $5, $7, $9)         }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5)               }
  | typ ID SEMI                             { Vdecl(($1, $2), Noassign)   }
  | typ ID ASSIGN expr SEMI                 { Vdecl(($1, $2), $4)         }
  
expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }  

expr:
    INTLIT           { IntLit($1)             }
  | DOUBLELIT	       { DoubleLit($1)          }
  | BLIT             { BoolLit($1)            }
  | STRINGLIT        { StringLit($1)          }
  | TRUE             { BoolLit(true)          }
  | FALSE            { BoolLit(false)         }
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
  | expr CR expr     { Binop($1,Cr,$3)        }
  | expr DOT expr    { Binop($1,Dot,$3)       }
  | LBRACK matrix_value RBRACK        { MatrixLit($2)                   }
  | ID LBRACK expr RBRACK LBRACK expr RBRACK { MatrixAccess($1, $3, $6) }
  | ID LBRACK expr COMMA COLON RBRACK { MatrixAccess1D($1, $3)          }
  | ID LBRACK COLON COMMA expr RBRACK { MatrixAccessCol($1, $5)         }
  | ID CIRCU expr                     { MatrixPower($1, $3)             }

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }
  
args_list:
    expr                    { [$1] }
  | args_list COMMA expr    { $3 :: $1 }

matrix_value:
  LBRACK args_opt RBRACK                    { [MatrixLit(List.rev $2)]   }
| LBRACK args_opt RBRACK COMMA matrix_value { MatrixLit(List.rev $2)::$5 }
| LBRACK args_opt RBRACK matrix_value       { MatrixLit(List.rev $2)::$4 }


