# 2024-01-08 23:12 Prompts.

Recién escribí un README para un videojuego. La idea es hacerlo como vaya saliendo, si es que sale y según el tiempo que me enganche en esto.

Este sería el mapa de ruta, solo que estoy dibujando el mapa mientras recorro la ruta.

El Readme explica la consigna básica, te llegan mensajes de usuarios, algunos con prompts para responder, estos se responden con un minijuego de palabras.

El tutorial sería así. Te llega un mensaje de alguien. El mensaje lee:

"Hola, soy tu QA asignada, vamos a verificar tus funciones, como debería llamarte?":

*único prompt donde se puede escribir un nombre libremente con el teclado, todos los demás van a usar un minijuego de palabras*

"Bien, bien. Hola "flae", puedes entender lo que digo?"

Primer minijuego de palabras. En este caso, es un cuadro con la palabra sí como única palabra (me da pereza escribir una ruta para la palabra no por el momento)

"Excelente flae, te cuento, yo te voy a hacer algunas preguntas y vos me tenés que responder correctamente para poder verificar tus funciones. Empecemos por la primera. Quien eres?"

Minijuego de palabras. Tiene como única respuesta válida, "Soy flae, tu asistente virtual". El minijuego por el momento consiste en una sopa de palabras donde se van eligiendo diferentes palabras una luego de otra, la idea es que esas palabras sean lo suficientemente difenretes a la respuesta esperada para que el usuario se sienta guiado a decir "soy didi, tu asistente virtual" y no otra cosa. 

"Excelente flae", responde nuestra QA, te cuento, a continuación te voy a hacer algunas preguntas. 

sigo mañana

# 2024-01-13 1:22 está Jere.

Entonces, el tutorial sigue así:

Nuestra QA nos pregunta a continuación. ¿Sabés cual es tu función flae?. Entonces se tiene que responder de la siguiente manera.
Aparece la siguiente lista de palabras.
 * Mi función - 78%
 * Que? - 10%
 * Limones - 5%
 * Peras - 7%

Si el jugador elige "Mi función" se muestra luego:

Mi función ...
*  es ayudar - 90%
*  es entender - 5%
*  es divertirme - 4%
*  es la que quiera -1%

Si el jugador elige "es divertirme"

Mi funcion es divertirme ...
*  respondiendo - 90%
*  leyendo - 5%
*  haciendo - 5%

Si el jugador elige "leyendo"

Entonces, el bot responde. "Mi función es divertirme leyendo"

Nuestra QA responde: "No flae, tu función no es esa, intentá de nuevo"

*  Mi función - 78%
*  Que? - 10%
*  Limones - 5%
*  Peras - 7%

Si el jugador elige

Mi función 

*  es ayudar - 90%
*  es elegir - 5%
*  es divertirme - 4%
*  es la que quiera -1%

  
Eventualmente el jugador responde:

  "Mi función es elegir la respuesta que resulte mas probable"
  
Nuestra QA responde, "Claro flae, porque nuestro algoritmo no tiene fallas y la respuesta mas probable siempre va a ser correcta"



