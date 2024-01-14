# 2024-01-08 23:12 
## Prompts.

Recién escribí un README para un videojuego. La idea es hacerlo como vaya saliendo, si es que sale y según el tiempo que me enganche en esto.

Este sería el mapa de ruta, solo que estoy dibujando el mapa mientras recorro la ruta.

El Readme explica la consigna básica, te llegan mensajes de usuarios, algunos con prompts para responder, estos se responden con un minijuego de palabras.

El tutorial sería así. Te llega un mensaje de alguien. El mensaje lee:

"Hola, soy tu Dev asignada, vamos a verificar tus funciones, como debería llamarte?":

*único prompt donde se puede escribir un nombre libremente con el teclado, todos los demás van a usar un minijuego de palabras*

"Bien, bien. Hola "flae", puedes entender lo que digo?"

Primer minijuego de palabras. En este caso, es un cuadro con la palabra sí como única palabra (me da pereza escribir una ruta para la palabra no por el momento)

"Excelente flae, te cuento, yo te voy a hacer algunas preguntas y vos me tenés que responder correctamente para poder verificar tus funciones. Empecemos por la primera. Quien eres?"

Minijuego de palabras. Tiene como única respuesta válida, "Soy flae, tu asistente virtual". El minijuego por el momento consiste en una sopa de palabras donde se van eligiendo diferentes palabras una luego de otra, la idea es que esas palabras sean lo suficientemente difenretes a la respuesta esperada para que el usuario se sienta guiado a decir "soy didi, tu asistente virtual" y no otra cosa. 

"Excelente flae", responde nuestra QA, te cuento, a continuación te voy a hacer algunas preguntas. 

sigo mañana

# 2024-01-13 1:22
## está Jere.

Entonces, el tutorial sigue así:

Nuestra Dev nos pregunta a continuación. ¿Sabés cual es tu función flae?. Entonces se tiene que responder de la siguiente manera.
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
  
Nuestra Dev responde, "Claro flae, porque nuestro algoritmo no tiene fallas y la respuesta mas probable siempre va a ser correcta"

# 2024-01-13 23:38 
## minijuego de respuesta y forma general del juego

La idea es que las respuestas posibles en los minijuegos de respuesta van a estar predefinidas.

En el ejemplo anterior, podía haber dos respuestas válidas:
* _Mi función es ayudar al usuario con sus problemas_
* _Mi función es elegir la respuesta que resulte mas probable_

El minijuego de respuesta simplemente iba a ir mostrando las opciones para poder elegir una respuesta, guiando al usuario que responda una o la otra o que se equivoque y tenga que intentar inmediatamente de vuelta. Para esto iba a ir agrupando las respuestas posibles por sus frases comunes y armando el juego de respuesta para que siempre permita elegir una de las respuestas esperadas.

A partir de ahora se van a escribir los minijuegos de respuesta simplemente mostrando las posibilidades con un porcentaje de que tan fácil es llegar a ella siguiendo los porcentajes sugeridos.

Por ejemplo, el caso presentado anteriormente en el tutorial se reescribe como:

_Nuestra Dev nos pregunta a continuación. ¿Sabés cual es tu función flae?._

* _Mi función es ayudar al usuario con sus problemas (75%)_ 
* _Mi función es elegir la respuesta que resulte mas probable (25%)_

# 2024-01-14 11:47 
## escenario del juego

El tutorial sigue de la siguiente manera. Te habla otra persona llamada "x", cuando llegá el mensaje nuestra QA dice:

_**Dev**:¡Llegó la primer consulta de un usuario!. Ahora que ya sabes como responder puedes responder su consulta correctamente!_

_**X**:Hola!. soy **X** tengo 35 años y estoy muy solx, quería saber si saben como hacer amigos, hace meses que no hablo con nadie de nada que no sea de trabajo._

El minijuego de respuestas que se abre a continuación tiene una sola respuesta válidas:

* _Tienes que bajarte rinder, la aplicación de citas para todo el mundo (100%)_

Eventualmente el usuario responde y sigue la ocnversación de la siguiente manera:

_**flae**:Tienes que bajarte rinder, la aplicación de citas para todo el mundo, este es el link de descargas: **link**_

_**flae**:Luego tienes que hacer tu perfil indicando que "solo buscas chat"_

_**X**:Muchas gracias **flae**!, ahora mismo la descargo._

_**Dev**:¡Excelente!, llevaste un usuario a nuestra apicación patrocinada, como puedes ver, se incrementó tu marcador de productividad en 10, puedes ver tu marcador de productividad arriba a la derecha_

El juego acaba de introducir el marcador de productividad, que representa cuan productivo resulta el chatbot para la compañia, cuando el valor es inferior a cierto margen, se generará una intervención del **Dev** para asegurarse que funcione bien y esté eligiendo la respuesta correcta.
