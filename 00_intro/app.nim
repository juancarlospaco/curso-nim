import strutils, karax / [karaxdsl, vdom]

template t(s: static string): VNode = text(s.strip)

writeFile "index.html", $(block: buildHtml(tdiv):

  section:
    h1: t"Bienvenida"

    t"""En la primera clase se introduce algunos conceptos basicos.
      Comenzando desde cero vas a aprender a crear y ejecutar programas basicos.
      Tambien presentamos algunos tipos de datos primitivos como los
      enteros, flotantes, booleanos, strings, funciones y variables.
      Mas adelante en el curso aprenderas lo necesario para crear programas mas avanzados.
      Comenzaremos por el tradicional programa 'Hola Mundo',
      que es un programa que muestra 'Hola Mundo' al ejecutarse.
      La funcion 'echo' muestra en pantalla el valor que se le pasa como argumento."""

    ol:
      li: t"Apreta el boton amarillo que dice 'Run!' para ejecutar el programa."
      li: t"Apreta el boton amarillo que dice 'Next' para avanzar de nivel."
      li: t"Apreta el boton gris de 'Share to ix' para compartir tu codigo via link."
      li: t"Apreta el boton gris de 'Previous' para retroceder."

    code: t"""
# Esto es un "Comentario", la linea comienza con 1 caracter "#" al principio.
# Toda la linea es ignorada y puede usarse para escribir observaciones.
echo "Hola Mundo" """


  section:
    h1: t"echo"

    t"""La funcion 'echo' sirve para mostrar por pantalla cualquier valor en una representacion de 'string',
    'echo' convertira los valores a 'string' y los imprimira en la linea de comando,
    puede tomar cualquier cantidad de argumentos de cualquier tipo, pero debe tener por lo menos 1 argumento,
    la representacion de 'string' es legible por humanos."""

    code: t"""echo 1, true, 2.0, "OwO", false, -9, 0"""


  section:
    h1: t"Booleanos"

    t"""El tipo booleano solo puede tener 2 valores, verdadero que es 'true' o falso que es 'false'.
    Se puede invertir el valor usando 'not', por ejemplo 'not true' es 'false' y 'not false' es 'true'.
    Cuando se crea un booleano su valor por defecto es 'false'."""

    ol:
      li: t"Apreta el boton amarillo que dice 'Run!' para ejecutar el programa."
      li: t"Apreta el boton amarillo que dice 'Next' para avanzar de nivel."

    code: t"""
echo true
echo false
echo not true
echo not false"""


  section:
    h1: t"Enteros"

    t"""Los numeros enteros llamados 'int' (integer) son numeros negativos o positivos, incluyendo el cero.
    En el caso de los numeros negativos el menos debe estar pegado al numero, es decir '- 5' debe ser '-5'.
    Cuando se crea un entero su valor por defecto es '0'."""

    ol:
      li: t"Apreta el boton amarillo que dice 'Run!' para ejecutar el programa."

    code: t"""
echo 0
echo 1
echo 9
echo -9
echo -5
echo -0  # -0 es 0"""


  section:
    h1: t"Strings"

    t"""El texto o cadenas de texto o cadenas de caracteres se llaman 'string',
    y puede contener cualquier texto como palabras, numeros, puntuacion, etc.
    Cuando se crea un string su valor por defecto es '""', que es un string vacio."""

    code: t"""
echo "Hola"
echo "1234"
echo "true"
echo ""  # String vacio """


  section:
    h1: t"Flotantes"

    t"""Los numeros de punto flotante o numeros de coma flotante se llaman 'float',
    pueden ser negativos, positivos, cero, e infinito.
    Cuando se crea un flotante su valor por defecto es '0.0'."""

    p: t"""'float' de acuerdo con el estandard de numeros de punto flotante tiene unos valores especiales,
    que indican infinito negativo e infinito positivo, que son numeros tan grandes que la PC no los puede interpretar,
    tambien una forma de No-Numero (Not A Number), estos "valores especiales" no se trataran en detalle en este curso."""

    code: t"""
echo 2.0
echo 3.14
echo 99.50 """


  section:
    h1: t"Matematica"

    t"""Matematica basica se puede realizar con distintos operadores, numeros y variables."""

    ul:
      li: t"Sumar usa el operador '+'."
      li: t"Restar usa el operador '-'."
      li: t"Multiplicar usa el operador '*'."
      li: t"Division entera usa el operador 'div'."
      li: t"Division flotante usa el operador '/'."

    code: t"""
echo 1 + 2
echo 2 - 1
echo 2 * 2
echo 4 / 2
echo 4 div 2 """


  section:
    h1: t"Variables"

    t"""Las variables pueden contener distintos valores de cualquier tipo bajo un nombre,
    idealmente los nombres de las variables deberian ser descriptivos de su contenido.
    Las variables necesitan ser declaradas usando 'var' y el nombre de la variable,
    luego de que son declaradas pueden utilizarse asignandole valores del mismo tipo,
    es decir si una variable tenia enteros solo puede alojar enteros,
    una variable tenia booleanos solo puede alojar booleanos, etc.
    Es posible declarar una variable usando su tipo en lugar de un valor.
    Es posible asignarle una variable a una variable, copiando una variable en otra.
    No es posible declarar una variable con el mismo nombre varias veces,
    por que se perderia el valor de la variable original si se pisan mutuamente.
    Mas adelante se explicara un uso mas avanzado de las variables.
    Cuando se crea una variable su valor por defecto es el valor por defecto de su tipo."""

    code: t"""
var numero = 1      # Variable declarada usando un valor.
numero = 99
numero = -3
echo numero
var texto = ""      # Variable declarada usando un valor vacio.
texto = "azul"
texto = "rojo"
echo texto
var booleano: bool  # Variable declarada usando un tipo.
booleano = true
echo booleano
var copia = numero
echo copia          # Variable copiada en otra variable.
echo numero
# var copia = 5     # ERROR: La variable ya existe. """


  section:
    h1: t"Comparacion"

    t"""La comparacion booleana sirve para comparar 2 valores o variables,
    y devolver un booleano 'true' o 'false', dependiendo de los valores comparados."""

    ul:
      li: t"Para comparar si dos valores son iguales se usa '=='."
      li: t"Para comparar si un valor es mayor que otro se usa '>'."
      li: t"Para comparar si un valor es mayor o igual que otro se usa '>='."
      li: t"Para comparar si un valor es menor que otro se usa '<'."
      li: t"Para comparar si un valor es menor o igual que otro se usa '=<'."

    code: t"""# Puedes probar cambiar este numero entero.
var numero = 5
echo numero == 5 """


  section:
    h1: t"if, elif, else"

    t"Control de flujo con if, elif, else."

    ul:
      li: t"'if' sirve para ejecutar o no un bloque de codigo dependiendo de una condicion booleana."
      li: t"'elif' se usa para agrupar varios 'if' juntos de manera tal que solo 1 de los 'elif' se ejecute."
      li: t"'else' se usa para ejecutar un bloque de codigo si ninguno de los 'if' y 'elif' se ejecuto."

    code: t"""
var condicion = false
if condicion:
  echo "condicion es true"
else:
  echo "condicion es false"

var numero = 0
if numero == 0:
  echo "Numero es igual a cero"
elif numero == 1:
  echo "Numero es igual a uno"
elif numero == 2:
  echo "Numero es igual a dos"
elif numero == 3:
  echo "Numero es igual a tres"
else:
  echo "Numero es algun otro valor" """


  section:
    h1: t"Secuencias"

    t"""Las secuencias son colleciones de valores, valores agrupados en un mismo contenedor,
    las secuencias pueden hacerse mas grandes o mas chicas, agregando o quitando valores,
    todos los items de una collecion deben ser del mismo tipo,
    la secuencia siempre tiene un tipo especifico que puede alojar, pero puede estar vacia tambien.
    La secuencia es construida con '@[ ]' y uno o mas valores, es decir por ejemplo '@[1]',
    los items de una secuencia se separan con comas, es decir por ejemplo '@[1, 2, 3]',
    tambien se puede crear usando el tipo en lugar del valor literal, por ejemplo 'seq[int]',
    basicamente '@[1, 2, 3]' es el mismo tipo de secuencia que 'seq[int]',
    si se trata de 'string' es '@["a", "b", "c"]' con tipo de secuencia que 'seq[string]',
    si se trata de 'float' es '@[1.0, 2.0, 3.0]' con tipo de secuencia que 'seq[float]', etc.
    """

    code: t"""
echo @[1, 2, 3]
echo @["a", "b", "c"]
echo @[1.0, 2.0, 3.0]
var secuencia0: seq[int]
var secuancia1: seq[bool]
var secuencia2: seq[float]
var secuencia3 = @[true, false, true] """


  section:
    h1: t"Secuencias en detalle"

    p: t"""Los items dentro de la secuencia tienen un numero entero de indice unico,
    el indice de las secuencias comienza por '0' para el primer item, hasta el ultimo item de la secuencia.
    No existen los indices negativos."""

    p: t"""Los items de una secuencia se pueden obtener por indice usando '[]',
    es decir secuencia[indice], por ejemplo 'secuencia[3]', que devuelve el item en el indice '3'."""

    p: t"""Para asignar un valor a un item de una secuencia, es decir modificar un item de la secuencia,
    se pueden asignar por indice usando '[]=', es decir secuencia[indice] = valor,
    por ejemplo 'secuencia[3] = 42', que asigna '42' al item en el indice '3'."""

    p: t"""Para saber la longitud total de una secuencia se puede usar 'len',
    es decir 'len(secuencia)' que devuelve un numero entero que es la longitud."""

    p: t"""Para agregar items a una secuencia se usa 'add', es decir 'secuencia.add(nuevoItem)'."""

    p: t"""Para borrar items de una secuencia se usa 'delete',
    de la forma 'secuencia.delete(indice)', es decir 'secuencia.delete(3)' para borrar el item en el indice '3'."""

    code: t"""
var secuencia: seq[int]
echo secuencia
echo len(secuencia)
secuencia.add(1)
secuencia.add(2)
echo len(secuencia)
echo secuencia[1]
secuencia.add(3)
secuencia[1] = 9
secuencia.delete(1)
echo secuencia
# secuencia.add(2.0)  ERROR: Es una secuencia de 'int' y '2.0' es 'float'.
# secuencia.delete(9) ERROR: No existe el indice '9' en la secuencia.
# secuencia[9] = 5    ERROR: No existe el indice '9' en la secuencia.
"""



  )
