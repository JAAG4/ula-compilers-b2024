%{
#include <stdio.h>
#include "expressions.hpp"
#include <iostream>

#define YYSTYPE Expression*
extern int yylex();
extern char* yytext;
int yyerror(const char*);
Expression* parser_result{nullptr};
%}

%define parse.error verbose

%token  TOKEN_ASSIGN
%token  TOKEN_VARIABLE
%token  TOKEN_INTEGER
%token  TOKEN_VOID
%token  TOKEN_IF
%token  TOKEN_ELSE
%token  TOKEN_WHILE
%token  TOKEN_RETURN
%token  TOKEN_BREAK
%token  TOKEN_DECLARE_FUNCTION
%token  TOKEN_ADDITION
%token  TOKEN_SUBSTRACTION
%token  TOKEN_MULTIPLICATION
%token  TOKEN_DIVISION
%token  TOKEN_LOGIC_AND
%token  TOKEN_LOGIC_OR
%token  TOKEN_LOGIC_NOT
%token  TOKEN_LOGIC_EQUAL
%token  TOKEN_L_PARENTHESIS
%token  TOKEN_R_PARENTHESIS
%token  TOKEN_L_BRACE
%token  TOKEN_R_BRACE
%token  TOKEN_COMMA
%token  LESSTHAN_TOKEN
%token  GREATERTHAN_TOKEN
%token  TOKEN_TRUE
%token  TOKEN_FALSE

%token  TOKEN_NUMBER
%token  TOKEN_IDENTIFIER
%token  TOKEN_STRING
%token  TOKEN_NEWLINE
%%
program : expression { parser_result = $1; }
;

expression : expression TOKEN_ADDITION term { $$ = new Addition($1, $3); }
     | expression TOKEN_SUBSTRACTION term { $$ = new Substraction($1, $3); }
     | term { $$ = $1; }
     | bool_logicals
;

comparatives:   term LESSTHAN_TOKEN term { $$ = new ComparisonLT($1, $3); }
            |   term GREATERTHAN_TOKEN term{ $$ = new ComparisonGT($1, $3); }
            |   term TOKEN_LOGIC_EQUAL term{ $$ = new ComparisonEQ($1, $3); }
;

boolvals:       TOKEN_TRUE {$$ = new Value(1);} | TOKEN_FALSE {$$ = new Value(0);}
;

bool_logicals:  boolvals { $$ = $1; }
            |   boolvals TOKEN_LOGIC_AND boolvals{ $$ = new BooleanAnd($1, $3); }
            |   boolvals TOKEN_LOGIC_OR boolvals{ $$ = new BooleanOr($1, $3); }
            |   TOKEN_LOGIC_NOT bool_logicals{ $$ = new BooleanNot($1); }
            |   comparatives { $$ = $1; }
            | factor TOKEN_LOGIC_AND boolvals

;

term :    term TOKEN_MULTIPLICATION factor { $$ = new Multiplication($1, $3); }
            |   term TOKEN_DIVISION factor {$$ = new Division($1,$3);}
            |   factor {$$ = $1;}
;

factor : TOKEN_SUBSTRACTION factor {$$ = new Substraction(new Value(0),$2);}
       | TOKEN_L_PARENTHESIS expression TOKEN_R_PARENTHESIS {$$ = $2;}
       | TOKEN_NUMBER {$$ = new Value(std::stoi(yytext));}
;
%%

int yyerror(const char* s)
{
    printf("Parse error: %s\n", s);
    return 1;
}