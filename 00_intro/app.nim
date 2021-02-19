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

    ol:
      li: t"Apreta el boton amarillo que dice 'Run!' para ejecutar el programa."
      li: t"Apreta el boton amarillo que dice 'Next' para avanzar de nivel."
      li: t"Apreta el boton gris de 'Previous' para retroceder."

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
    Cuando se crea un string su valor por defecto es '""', que es un string vacio.
    Se puede concatenar 2 'string' usando '&'. """

    code: t"""
echo "Hola"
echo "1234"
echo "true"
echo ""  # String vacio
"""


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

    t"""Matematica basica se puede realizar con distintos operadores y valores numericos."""

    ul:
      li: t"Sumar usa el operador '+'."
      li: t"Restar usa el operador '-'."
      li: t"Multiplicar usa el operador '*'."
      li: t"Division flotante usa el operador '/'."
      li: t"Division entera usa el operador 'div'."
      li: t"Modulo usa el operador 'mod'."

    code: t"""
echo 1 + 2
echo 2 - 1
echo 2 * 2
echo 4 / 2
echo 4 div 2
echo 4 mod 2 """


  section:
    h1: t"assert, type, is"

    p: t"""La funcion 'assert' sirve para chequear que una expresion es verdadera, si es falsa emite un error. """

    p: t"""La funcion 'type' sirve para mostrar el tipo concreto de cualquier valor."""

    p: t"""La funcion 'is' sirve para chequear si un valor es de un tipo especifico."""

    code: t"""
assert true
assert 42 == 42
assert 42 is int
assert 9.9 is float
assert "x" is string
assert true is bool
var variable = "ejemplo"
echo type(variable)
echo type(true)
echo type(5) """


  section:
    h1: t"Variables"

    p: t"""Las variables pueden contener distintos valores de cualquier tipo bajo un nombre,
    idealmente los nombres de las variables deberian ser descriptivos de su contenido.
    Las variables necesitan ser declaradas usando 'var' y el nombre de la variable,
    luego de que son declaradas pueden utilizarse asignandole valores del mismo tipo,
    es decir si una variable tenia enteros solo puede alojar enteros,
    una variable tenia booleanos solo puede alojar booleanos, etc."""

    p: t"""Es posible declarar una variable usando su tipo en lugar de un valor.
    Es posible asignarle una variable a una variable, copiando una variable en otra.
    No es posible declarar una variable con el mismo nombre varias veces,
    por que se perderia el valor de la variable original si se pisan mutuamente.
    Mas adelante se explicara un uso mas avanzado de las variables.
    Cuando se crea una variable su valor por defecto es el valor por defecto de su tipo."""

    ul:
      li: t"Tipo 'bool' son valores como 'true' o 'false'."
      li: t"Tipo 'int' son valores como '0', '9', '-1', '-99', '42'."
      li: t"Tipo 'float' son valores como '1.0', '3.14', '-9.5', '5.555'."
      li: t"""Tipo 'string' son valores como '"a"', '""', '"OwO"', '"palabras"'."""

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

    code: t"""
var numero = 5    # Puedes probar cambiar este numero entero.
echo numero == 5  # Puedes probar cambiar este operador de comparacion por otro."""


  section:
    h1: t"if, elif, else"

    t"""Control de flujo con if, elif, else.
    La indentacion con 2 espacios se usa para marcar grupos de comandos que van juntos, delimita un bloque de codigo."""

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
    h1: t"Arrays"

    t"""Los Arrays son colleciones de valores, valores agrupados en un mismo contenedor,
    los Arrays son de capacidad y longitud fija, por lo tanto no pueden crecer,
    no se puede agregar ni quitar mas valores, pero si se pueden modificar los valores existentes,
    todos los items de un array deben ser del mismo tipo,
    el array siempre tiene un tipo especifico que puede alojar.
    El array es construido con '[ ]' y uno o mas valores, es decir por ejemplo '[1]',
    los items de un Array se separan con comas, es decir por ejemplo '[1, 2, 3]',
    tambien se puede crear usando el tipo en lugar del valor literal,
    es decir array[longitud, tipo], por ejemplo 'array[3, int]' para un array de 3 'int',
    basicamente '[1, 2, 3]' es el mismo tipo que 'array[3, int]',
    si se trata de 'string' es '["a", "b", "c"]' con tipo 'array[3, string]',
    si se trata de 'float' es '[1.0, 2.0, 3.0]' con tipo 'array[3, float]', etc.
    """

    p: t"""Array es como seq pero de capacidad estatica."""

    code: t"""
echo [1, 2, 3]
echo ["a", "b", "c"]
echo [1.0, 2.0, 3.0]
var ejemplo: array[3, int]
ejemplo[0] = 1
ejemplo[0] = 42
echo ejemplo[0]
"""


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

    p: t"""Seq es como Array pero de capacidad dinamica."""

    code: t"""
echo @[1, 2, 3]
echo @["a", "b", "c"]
echo @[1.0, 2.0, 3.0]
var secuencia0: seq[int]
var secuancia1: seq[bool]
var secuencia2: seq[float]
var secuencia3 = @[true, false, true] """


  section:
    h1: t"Operaciones con Secuencias"

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

    p: t"""El operador '@' puede convertir un Array en Seq. Array y Seq usan una interface de uso similar."""

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
# secuencia.add(2.0)  # ERROR: Es una secuencia de 'int' y '2.0' es 'float'.
# secuencia[9] = 5    # ERROR: No existe el indice '9' en la secuencia.
# echo secuencia[-1]  # ERROR: No existen los indices negativos.
var arra = [1, 2, 3]
var seqArra = @arra   # 'array[int]' convertido en 'seq[int]' usando '@'.
seqArra.add(4)
echo seqArra """


  section:
    h1: t"Cierre"

    p: t"""En esta sesion aprendimos a editar y ejecutar distintos programas sencillos.
    Vimos diferentes tipos de datos, como los enteros, flotantes, boleanos y demas.
    Tambien algunas funciones basicas para mostrar distinta informacion en pantalla.
    Los conceptos explicados van a ser progresivamente mas desafiantes."""

    h3: t"""Desafio"""
    p: t"""El codigo del ejercicio es un convertidor de temperaturas, pero el codigo esta incompleto,
    si la temperatura en 'kelvin' es igual a la temperatura 'celsius' mas 273 grados,
    complete el codigo para hacerlo funcionar."""

    code: t"""
var celsius = 22
var fahrenheit = float(celsius) * 1.8 + 32.0

var kelvin = 0

echo "Temperatura en Celsius: ", celsius
echo "Temperatura en Fahrenheit: ", fahrenheit
echo "Temperatura en Kelvin: ", kelvin
assert kelvin == 295 """


  )
