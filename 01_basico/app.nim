import strutils, karax / [karaxdsl, vdom]

template t(s: static string): VNode = text(s.strip)

writeFile "index.html", $(block: buildHtml(tdiv):

  section:
    h1: t"For"

    p: t"""El bucle 'for' sirve para iterar un valor iterable,
    para aplicar algun tipo de logica a los items individualmente,
    es posible iterar por indices o por los items directamente,
    'for' itera de inicio a fin de algun argumento iterable."""

    p: t"""Aqui tambien se presentan el operador '..',
    que sirve para para crear rangos de valores ordinales, como valores numericos."""

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
  echo "Esto jamas se ejecuta por que el rango esta vacio"

for i in 5..9:
  echo i """

)
