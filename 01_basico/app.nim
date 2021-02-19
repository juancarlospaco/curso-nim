import strutils, karax / [karaxdsl, vdom]

template t(s: static string): VNode = text(s.strip)

writeFile "index.html", $(block: buildHtml(tdiv):

  section:
    h1: t"For"

    p: t"""El bucle 'for' sirve para iterar un valor iterable,
    para aplicar algun tipo de logica a los items individualmente,
    es posible iterar por indices o por los items directamente,
    'for' itera de inicio a fin de algun argumento iterable.
    El bucle 'for' puede ser interrumpido usando 'break'."""

    p: t"""Aqui se presenta el operador '..',
    que sirve para para crear rangos de valores ordinales, como valores numericos."""

    p: t"""Tambien existe el operador '..<', que es similar al '..' pero es no-inclusivo,
    quiere decir que el ultimo numero mas alto no esta incluido en el rango generado,
    es decir que 'a..<b' es igual a 'a..(b - 1)' pero nos ahorra codigo,
    algunas implementaciones de codigo necesitaran el '..' y otras el '..<'."""

    code: t"""
var secuencia = @[1, 2, 3, 4, 5, 6]
for item in secuencia:
  if item mod 2 == 0:
    echo "item es par"
  else:
    echo "item es impar"

var palabra: string
for item in ["v", "e", "r", "d", "e"]:
  palabra.add(item)
assert palabra == "verde"

for i in 0..0:
  echo "Esto se ejecuta 1 sola vez por que el rango tiene 1 item"

for i in 5..9:
  echo i
  if i == 7: break """


  section:
    h1: t"While"

    p: t"""El bucle 'while' sirve para repetir un bloque de codigo siempre y
    cuando un argumento de condicion booleana sea verdadera.
    El bucle 'while' puede ser interrumpido usando 'break'."""

    p: t"""Aqui se usa por primera vez los operadores 'inc' y 'dec',
    'inc' es para incrementar valores ordinales, como valores numericos,
    permite poder escribir 'inc i' en lugar de 'i = i + 1',
    'dec' es para decrementar valores, como valores numericos,
    permite poder escribir 'dec i' en lugar de 'i = i - 1' y nos ahorra codigo."""

    code: t"""
var x = 0
while not(x == 9):
  echo x
  inc x  # x = x + 1

var y = 9
while not(y == 0):
  echo y
  dec y  # y = y - 1

var z = 0
while true:
  echo z
  inc z
  if z == 9: break """


  section:
    h1: t"Char"

    p: t"""Ahora que sabemos usar bucles podemos iterar el texto en los 'string',
    descubriremos que las letras individuales tambien tienen un tipo concreto,
    el caracter 'char' representa 1 letra, de ahi viene el nombre "cadena de caracteres",
    el char se construye con dos comillas simples y solo puede contener 1 caracter.
    El espacio en blanco, tabulador y la nueva linea (salto de linea) tambien son caracteres."""

    p: t"""La computadora representa las letras en el texto como numeros enteros,
    por lo tanto un 'char' es compatible con un 'int', es un valor ordinal numerico,
    'char' puede usar 'inc', 'dec', '..', '..<', '+', '-' que vimos anteriormente,
    por ejemplo el valor entero del 'char' de 'a' es '97',
    si al 'a' le sumas 1 obtienes 'b', si al 'a' le sumas 2 obtienes 'c', etc."""

    ul:
      li: t"'char' se puede convertir en 'int' usando 'ord'."
      li: t"'int' se puede convertir en 'char' usando 'char'."

    code: t"""
var caracter = 'a'
assert caracter is char

var numeros = '0'..'9'
echo numeros

for letra in "ejemplo":  # Es posible iterar los 'char' de un 'string' directamente.
  echo letra, ' ', ord(letra)   # ' ' es un char de Espacio.
  assert letra is char
  assert ord(letra) is int

for letra in 'a'..'z':  # Como es un valor ordinal se puede crear rangos de letras.
  echo letra, '\t', ord(letra)  # '\t' es un caracter de Tabulador (Tab).
  assert letra is char
  assert ord(letra) is int """


  section:
    h1: t"Desafio"

    p: t"""El 'char' es un valor numerico ordinal, si a un 'A' le sumas '32' da un 'a',
    usando este simple hecho desarrolla un programa para convertir un 'string' en MAYUSCULAS a minusculas."""

    code: t"""
var mayuscula = 'A'                       # Letra 'A' (mayuscula).
var minuscula = char(ord(mayuscula) + 32) # Letra 'a' (minuscula).
assert minuscula == 'a'                   # Minuscula es 'a'

var resultado = ""
for letra in "GATO":

  # Edita tu codigo aca.

  resultado.add(minuscula)
assert resultado == "gato" """



)
