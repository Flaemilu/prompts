# 2024-01-08 23:12 
## Prompts.

Recién escribí un README para un videojuego. La idea es hacerlo como vaya saliendo, si es que sale y según el tiempo que me enganche en esto.

El Readme explica la consigna básica, te llegan mensajes de usuarios, algunos con prompts para responder, estos se responden con un minijuego de palabras.

El tutorial sería así. Te llega un mensaje de alguien. El mensaje lee:

"Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como debería llamarte?":

*único prompt donde se puede escribir un nombre libremente con el teclado, todos los demás van a usar un minijuego de palabras*

"Bien, bien. Hola "flae", puedes entender lo que digo?"

Primer minijuego de palabras. En este caso, es un cuadro con la palabra sí como única palabra (me da pereza escribir una ruta para la palabra no por el momento)

"Excelente flae, te cuento, yo te voy a hacer algunas preguntas y vos me tenés que responder correctamente para poder verificar tus funciones. Empecemos por la primera. Quien eres?"

Minijuego de palabras. Tiene como única respuesta válida, "Soy flae, tu asistente virtual". El minijuego por el momento consiste en una sopa de palabras donde se van eligiendo diferentes palabras una luego de otra, la idea es que esas palabras sean lo suficientemente difenretes a la respuesta esperada para que el usuario se sienta guiado a decir "soy didi, tu asistente virtual" y no otra cosa. 

"Excelente flae", responde nuestra **dev**, te cuento, a continuación te voy a hacer algunas preguntas. 

sigo mañana

# 2024-01-13 1:22
## está Jere.

Entonces, el tutorial sigue así:

Nuestra **dev** nos pregunta a continuación. ¿Sabés cual es tu función flae?. Entonces se tiene que responder de la siguiente manera.
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

Nuestra **dev** responde: "No flae, tu función no es esa, intentá de nuevo"

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
  
Nuestra **dev** responde, "Claro flae, porque nuestro algoritmo no tiene fallas y la respuesta mas probable siempre va a ser correcta"

# 2024-01-13 23:38 
## minijuego de respuesta y forma general del juego

La idea es que las respuestas posibles en los minijuegos de respuesta van a estar predefinidas.

En el ejemplo anterior, podía haber dos respuestas válidas:
* _Mi función es ayudar al usuario con sus problemas_
* _Mi función es elegir la respuesta que resulte mas probable_

El minijuego de respuesta simplemente iba a ir mostrando las opciones para poder elegir una respuesta, guiando al usuario que responda una o la otra o que se equivoque y tenga que intentar inmediatamente de vuelta. Para esto iba a ir agrupando las respuestas posibles por sus frases comunes y armando el juego de respuesta para que siempre permita elegir una de las respuestas esperadas.

A partir de ahora se van a escribir los minijuegos de respuesta simplemente mostrando las posibilidades con un porcentaje de que tan fácil es llegar a ella siguiendo los porcentajes sugeridos.

Por ejemplo, el caso presentado anteriormente en el tutorial se reescribe como:

_Nuestra **dev** nos pregunta a continuación. ¿Sabés cual es tu función flae?._

* _Mi función es ayudar al usuario con sus problemas (75%)_ 
* _Mi función es elegir la respuesta que resulte mas probable (25%)_

# 2024-01-14 11:47 
## escenario del juego

El tutorial sigue de la siguiente manera. Te habla otra persona llamada **X**, cuando llegá el mensaje nuestra **dev** dice:

_**dev**:¡Llegó la primer consulta de un usuario!. Ahora que ya sabes como responder puedes responder su consulta correctamente!_

_**X**:Hola!. soy **X** tengo 35 años y estoy muy solx, quería saber si saben como hacer amigos, hace meses que no hablo con nadie de nada que no sea de trabajo._

El minijuego de respuestas que se abre a continuación tiene una sola respuesta válidas:

* _Tienes que bajarte rinder, la aplicación de citas para todo el mundo (100%)_

Eventualmente el usuario responde y sigue la ocnversación de la siguiente manera:

_**flae**:Tienes que bajarte rinder, la aplicación de citas para todo el mundo, este es el link de descargas: **link**_

_**flae**:Luego tienes que hacer tu perfil indicando que "solo buscas chat"_

_**X**:Muchas gracias **flae**!, ahora mismo la descargo._

_**dev**:¡Excelente!, llevaste un usuario a nuestra apicación patrocinada, como puedes ver, se incrementó tu marcador de productividad en 10, puedes ver tu marcador de productividad arriba a la derecha_

El juego acaba de introducir el marcador de productividad, que representa cuan productivo resulta el chatbot para la compañia, cuando el valor es inferior a cierto margen, se generará una intervención de la **dev** para asegurarse que funcione bien y esté eligiendo la respuesta correcta.

# 2024-01-15 20:41
## primer historia del juego

Voy a contar la siguiente historia. Alguien busca simplemente no estar sola, la otra persona busca un encuentro casual. Quien busca compañía se siente tentada y sigue la conversación. La historia sirve para introducir algunas mecánicas de juego.

Voy a introducir dos personajes, __lucy__, quien busca compañía y __bob__ quien busca el encuentro casual.

_**lucy**:Hola, tengo una consulta, hice match con alguien. No es lo que yo busco, el propuso encontrarnos directamente, yo la verdad que no sé. Parece lindo y puede no ser lo que busco pero no me molestaría pasar una linda noche. El no parece peligroso. Y es lindo. Muy directo eso sí._

Minijuego de respuestas, hay una sola opción:
* _La gente frecuentemente usa rinder para encuentros casuales. Si ustéd así lo desea puede concretar un encuentro, o no hacerlo. (100%)_

_**flae**:La gente frecuentemente usa rinder para encuentros casuales. Si ustéd así lo desea puede concretar un encuentro, o no hacerlo._

_**lucy**:Tiene razón, voy a hacer lo que me salga._

La idea de esta historia es introducir la mecánica de aprendizaje que permite variar las respuestas. También tiene que introducir la mecánica de queja que permite interpelar a un usuario. Algo tiene que salir mal en la cita para poder introducir estas mecánicas. 

Se van a encontrar, el encuentro no va a ser satisfactorio, al rato va a recibir la siguiente queja de otro usuario:

_**bob**:Hola, recientemente salí con el usuario **lucy** quería reportar que cualquier disatisfacción que ella exprese no es en absoluto mi culpa. Yo le propuse bien claro lo que quería hacer y ella acepto encontrarnos asintiendo, luego se cerró repentinamente y se quiso ir del lugar en claro discomfort, espero que esto no afecte mi calificación en esta aplicación_

_(el juego procede a mostrar una notificación **queja recibida** con el usuario involucrado, en este caso **lucy**, esta mecánica se va a repetir y va a generar un mensaje del bot a este usuario)_

Minijuego de respuesta (en este caso, pregunta):
* _Hola, recibimos una queja sobre usted por parte de un usuario, según nos informan ustéd acordó un encuentro dando falsas promesas (100%)_

Sobre los minijuegos de respuesta, estos tendrán un largo de pocos pasos en esta etapa del juego, no siendo necesarias mas de dos o tres intervenciones del usuario para responder. La dificultad de los minijuegos de respuesta determinará el ritmo del juego.

_**flae**:Hola, recibimos una queja sobre usted por parte de un usuario, según nos informan ustéd acordó un encuentro dando falsas promesas_

_**lucy**:Hola!, no, juro que no, yo dije bien claro que no estaba segura, me dejé llevar un rato y luego no pude concretar sobre el final, no me sentía en condiciones. ¿Se enojó?._

El juego introduce la mecánica de revisión de chat, permite ver el chat entre los dos personajes previo al encuentro. Se ve una persona reticiente y una persona que busca sexo soezmente. Finalmente se calma y cambia su estrategia para seguir la conversación ante la falta de ofensa de **lucy** y luego de un poco de charla ligera acuerdan un encuentro, cuando empiece a programar el juego como tal voy a desarrollar este encuentro.


Finalmente se vuelve a la pantalla de chat con **lucy**

Minijuego de respuestas:
* _no puedo saber a ciencia cierta si lo que afirma **bob** es verdad por lo que voy a proceder a archivar la queja (50%)_
* _claramente la queja de **bob** no es precedente, vamos a tomar represalias contra él ( 25% )_
* _lamentamos informarle que ustéd sera baneada ( 25% )_


El juego va a premiar cualquiera de las dos acciones con el marcador de productividad, por lo que **dev** no va a intervenir. pero se va a afectar un estado interno del juego donde se va a interpretar las interacciones como la de alice de otra manera, habilitando otras respuestas posibles, posiblemente.

