%{
#include <stdio.h>

extern int yylex();
extern char* yytext;
int yyerror(const char*);
%}


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
%token  LESSTHAN_TOKEN
%token  GREATERTHAN_TOKEN
%token  TOKEN_TRUE
%token  TOKEN_FALSE

%token  TOKEN_NUMBER
%token  TOKEN_IDENTIFIER
%token  TOKEN_STRING

%%
program : expression
        ;

statement :     definition statement
            |   proposition statement
            |   assignment statement
            ;

expression : expression TOKEN_ADDITION term
     | expression TOKEN_SUBSTRACTION term
     | term
     ;

datatype :    TOKEN_INTEGER
            | TOKEN_VOID
            | TOKEN_STRING
            ;

definition:     TOKEN_VARIABLE datatype
            |   TOKEN_VARIABLE datatype
            |   TOKEN_VARIABLE datatype
            ;

assignment:     TOKEN_IDENTIFIER TOKEN_ASSIGN booleans
            |   TOKEN_IDENTIFIER TOKEN_ASSIGN expression
            |   TOKEN_IDENTIFIER TOKEN_ASSIGN TOKEN_NUMBER
            ;

expression :    expression TOKEN_ADDITION term
            |   expression TOKEN_SUBSTRACTION term
            |   term
            |   booleans
            ;

comparatives:   term LESSTHAN_TOKEN term
            |   term GREATERTHAN_TOKEN term

boolvals:           TOKEN_TRUE | TOKEN_FALSE;

booleans:       boolvals
            |   boolvals TOKEN_LOGIC_AND boolvals
            |   boolvals TOKEN_LOGIC_OR boolvals
            |   boolvals TOKEN_LOGIC_EQUAL boolvals
            |   TOKEN_LOGIC_NOT booleans
            |   TOKEN_L_PARENTHESIS booleans TOKEN_R_PARENTHESIS
            |   comparatives

term :       TOKEN_IDENTIFIER
            |   term TOKEN_MULTIPLICATION term
            |   term TOKEN_DIVISION term
            |   factor
            ;

factor : TOKEN_SUBSTRACTION factor
       | TOKEN_L_PARENTHESIS expression TOKEN_R_PARENTHESIS
       | TOKEN_NUMBER
       ;
%%

int yyerror(const char* s)
{
    printf("Parse error: %s\n", s);
    return 1;
}