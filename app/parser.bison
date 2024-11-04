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
%token  TOKEN_COMMA
%token  LESSTHAN_TOKEN
%token  GREATERTHAN_TOKEN
%token  TOKEN_TRUE
%token  TOKEN_FALSE

%token  TOKEN_NUMBER
%token  TOKEN_IDENTIFIER
%token  TOKEN_STRING
%token TOKEN_NEWLINE
%%
program : expression | statement

        ;

statement:      definition | assignment
        ;

expression : expression TOKEN_ADDITION term
     | expression TOKEN_SUBSTRACTION term
     | term
     | bool_logicals
     ;

datatype :    TOKEN_INTEGER
            | TOKEN_VOID
            | TOKEN_STRING
            ;

definition:     TOKEN_VARIABLE datatype TOKEN_IDENTIFIER
            |   TOKEN_VARIABLE datatype assignment
;

assignment: TOKEN_IDENTIFIER TOKEN_ASSIGN expression
            ;

comparatives:   term LESSTHAN_TOKEN term
            |   term GREATERTHAN_TOKEN term

boolvals:       TOKEN_TRUE | TOKEN_FALSE;

bool_logicals:       boolvals
            |   boolvals TOKEN_LOGIC_AND boolvals
            |   boolvals TOKEN_LOGIC_OR boolvals
            |   boolvals TOKEN_LOGIC_EQUAL boolvals
            |   TOKEN_LOGIC_NOT bool_logicals
            |   comparatives

term :       TOKEN_IDENTIFIER
            |   term TOKEN_MULTIPLICATION factor
            |   term TOKEN_DIVISION factor
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