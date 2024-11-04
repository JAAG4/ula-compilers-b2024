# palabras (reservadas) para el lenguaje:
- Variables y valores de retorno :
    - `var`
    - `int`
    - `string` *
    - `boolean` *
    - `void` *
- Control de flujo:
    - `if`
    - `else`
    - `while`
    - `break`
    - `end` *?
- Declaración/Definicion de funciones:
    - `function`
- Aritmética de números: 
    - `+`
    - `-`
    - `*` 
    - `/` *
- Aritmética lógica/comparación: 
    - `and`
    - `or`
    - `not`
    - `==` / `eqs`*
    - `>` / `gt`*
    - `<` / `lt`*
- Funciones nativas?
    - `print`*
# Examples:

## Valid Programs

```
var int x = 5
x = x + 10

if x not == 99
print "Text"

else
print "Foo"
```

```
function int sum(int a,int b) 
var int result = a + b
return result


var int x
x = sum(10,5)
print x
```

```
function void iprint(int a)
print a
return void
```

## Invalid

```
function int numbers(int a)
print a
return void
```

```
var int void
```

```
var void x
```

```
function function function()
return void
```

```
var int = 42
```

```
var string text = "X"
var int number = 0

text + number
```

## Tokens
```c
"="              {return TOKEN_ASSIGN;}
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
                 
{NUMBER}         {return TOKEN_NUMBER;}
{IDENTIFIER}     { return TOKEN_IDENTIFIER; }
{TEXT}           { return TOKEN_STRING; }
```

## Parser Bison
```YAML
program

statement

expression

datatype

definition

assignment

comparatives

boolvals

bool_logicals

term

factor
```