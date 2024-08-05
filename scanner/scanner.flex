%{
#include "token.h"
%}

SPACE      [ \t\n]
DIGIT      [0-9]
LETTER     [A-Za-z]
IDENTIFIER (_|{LETTER})({DIGIT}|{LETTER}|_)*
TEXT       \"({DIGIT}|{LETTER}|{SPACE})*\"

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
"and"            {return TOKEN_LOGIC_AND;}
"or"             {return TOKEN_LOGIC_OR;}
"not"            {return TOKEN_LOGIC_NOT;}
"=="             {return TOKEN_LOGIC_EQUAL;}
"("              {return TOKEN_L_PARENTHESIS;}
")"              {return TOKEN_R_PARENTHESIS;}
"{"              {return TOKEN_L_BRACE;}
"}"              {return TOKEN_R_BRACE;}

{IDENTIFIER} { return TOKEN_IDENTIFIER; }
{TEXT}       { return TOKEN_STRING; }
%%

int yywrap() { return 1; }