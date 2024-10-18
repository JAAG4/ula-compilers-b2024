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