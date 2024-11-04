%{
#include "token.h"
%}

SPACE      [ \t]
TOKEN_NEWLINE [\n]
DIGIT      [0-9]
LETTER     [A-Za-z]

IDENTIFIER (_|{LETTER})({DIGIT}|{LETTER}|_)*
TEXT       \"({DIGIT}|{LETTER}|{SPACE})*\"
NUMBER     {DIGIT}+

%%
{SPACE}          { /* Ignore */ }
"="              { return TOKEN_ASSIGN; }
"var"            {return TOKEN_VARIABLE;}
"int"            {return TOKEN_INTEGER;}
"void"           {return TOKEN_VOID;}
"if"             {return TOKEN_IF;}
"else"           {return TOKEN_ELSE;}
"while"          {return TOKEN_WHILE;}
"return"         {return TOKEN_RETURN;}
"breakloop"      {return TOKEN_BREAK;}
"function"       {return TOKEN_DECLARE_FUNCTION;}
"+"              {return TOKEN_ADDITION;}
"-"              {return TOKEN_SUBSTRACTION;}
"*"              {return TOKEN_MULTIPLICATION;}
"/"              {return TOKEN_DIVISION;}
"and"            {return TOKEN_LOGIC_AND;}
"or"             {return TOKEN_LOGIC_OR;}
"not"            {return TOKEN_LOGIC_NOT;}
"=="             {return TOKEN_LOGIC_EQUAL;}
"("              {return TOKEN_L_PARENTHESIS;}
")"              {return TOKEN_R_PARENTHESIS;}
"{"              {return TOKEN_L_BRACE;}
"}"              {return TOKEN_R_BRACE;}
","              {return TOKEN_COMMA;}
"<"              {return LESSTHAN_TOKEN;}
">"              {return GREATERTHAN_TOKEN;}
"true"           {return TOKEN_TRUE;}
"false"          {return TOKEN_FALSE;}
TOKEN_NEWLINE    {return TOKEN_NEWLINE;}

{NUMBER} {return TOKEN_NUMBER;}
{IDENTIFIER} { return TOKEN_IDENTIFIER; }
{TEXT}       { return TOKEN_STRING; }
%%

int yywrap() { return 1; }