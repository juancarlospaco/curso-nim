import strutils, karax / [karaxdsl, vdom]

template t(s: static string): VNode = text(s.strip.unindent)

writeFile "index.html", $(block: buildHtml(tdiv):

  section:
    h1: t"Bienvenida"

    t"""En la primera clase se introduce algunos conceptos basicos.
      Comenzando desde cero vas a aprender a crear y ejecutar programas basicos.
      Tambien presentamos algunos tipos de datos primitivos como los
      enteros, flotantes, booleanos, strings, funciones y variables.
      Mas adelante en el curso aprenderas lo necesario para crear programas mas avanzados.
      Comenzaremos por el tradicional programa 'Hola Mundo',
      que es un programa que muestra 'Hola Mundo' al ejecutarse."""

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
      echo 0, 1, 9
      echo -9, -5
      echo -0  # -0 es 0"""


  section:
    h1: t"Strings"

    t"""El texto o cadenas de texto o cadenas de caracteres se llaman 'string',
    y puede contener cualquier texto como palabras, numeros, puntuacion, etc.
    Cuando se crea un string su valor por defecto es '""', que es un string vacio."""

    code: t"""
      echo "Hola"
      echo "1234"
      echo "true" """


  section:
    h1: t"Flotantes"

    t"""Los numeros de punto flotante o numeros de coma flotante se llaman 'float',
    pueden ser negativos, positivos, cero, e infinito.
    Cuando se crea un flotante su valor por defecto es '0.0'."""

    code: t"""
      echo 2.0
      echo 3.14
      echo 99.50 """


  section:
    h1: t"Variables"

    t"""Las variables pueden contener distintos valores de cualquier tipo bajo un nombre,
    idealmente los nombres de las variables deberian ser descriptivos de su valor contenido.
    Las variables necesitan ser declaradas usando 'var' y el nombre de la variable,
    luego de que son declaradas pueden utilizarse asignandole valores del mismo tipo,
    es decir si una variable tenia enteros solo puede alojar enteros,
    una variable tenia booleanos solo puede alojar booleanos, etc.
    Es posible declarar una variable usando su tipo en lugar de un valor.
    Cuando se crea una variable su valor por defecto es el valor por defecto de su tipo."""

    code: t"""
      var numero = 1
      numero = 99
      numero = -3
      echo numero
      var texto = ""      # Variable declarada usando un valor.
      texto = "azul"
      texto = "rojo"
      echo texto
      var booleano: bool  # Variable declarada usando un tipo.
      booleano = true
      echo booleano """








  )
