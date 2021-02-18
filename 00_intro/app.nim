import strutils, karax / [karaxdsl, vdom]

template t(s: static string): VNode = text(s)

# template prepro(s: VNode): string = multiReplace($(s), [("<div>", ""), ("</div>", "")]).strip

writeFile "index.html", $(block: buildHtml(tdiv):
  section:
    h1:
      t"Bienvenida"

    t"""En la primera clase se introduce algunos conceptos basicos.
      Comenzando desde cero vas a aprender a crear y ejecutar programas basicos.
      Tambien presentamos algunos tipos de datos primitivos como los
      enteros, flotantes, booleanos, strings, funciones y variables.
      Mas adelante en el curso aprenderas lo necesario para crear programas mas avanzados.
      Comenzaremos por el tradicional programa 'Hola Mundo',
      que es un programa que muestra 'Hola Mundo' al ejecutarse."""

    code:
      t"""
      # Esto es un "Comentario", la linea comienza con 1 caracter "#" al principio.
      # Toda la linea es ignorada y puede usarse para escribir observaciones.
      echo "Hola Mundo"
      """
  )
