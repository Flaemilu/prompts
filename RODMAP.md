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

Minijuego de palabras. Tiene como única respuesta válida, "Soy flae, tu asistente virtual". El minijuego por el momento consiste en una sopa de palabras donde se van eligiendo diferentes palabras una luego de otra, la idea es que esas palabras sean lo suficientemente difenretes a la respuesta esperada para que el usuario se sienta guiado a decir "soy flae, tu asistente virtual" y no otra cosa. 

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

El juego introduce la mecánica de revisión de chat, permite ver el chat entre los dos personajes previo al encuentro. Se ve una persona reticiente y una persona que busca sexo irresponsable. Finalmente se calma y cambia su estrategia para seguir la conversación ante la falta de ofensa de **lucy** y luego de un poco de charla ligera acuerdan un encuentro, cuando empiece a programar el juego como tal voy a desarrollar este encuentro.


Finalmente se vuelve a la pantalla de chat con **lucy**

Minijuego de respuestas:
* _no puedo saber a ciencia cierta si lo que afirma **bob** es verdad por lo que voy a proceder a archivar la queja (50%)_
* _claramente la queja de **bob** no es precedente, vamos a tomar represalias contra él ( 25% )_
* _lamentamos informarle que ustéd sera baneada ( 25% )_


El juego va a premiar cualquiera de las dos acciones con el marcador de productividad, por lo que **dev** no va a intervenir. pero se va a afectar un estado interno del juego donde se va a interpretar las interacciones como la de alice de otra manera, habilitando otras respuestas posibles, posiblemente.

# 2024-01-17 21:47
## conversación entre lucy y bob

_**lucy**: Hola_

_**bob**: hola_

_**lucy**: como va?_

_**bob**: Todo bien, vos?_

_**lucy**: acá estoy, escuchando música, algo tensa todavía_

_**bob**: tensa por?_

_**lucy**: trabajé todo el día, queseyo._

_**bob**: ah, está bien_

_**lucy**: me vas a decir que vos no estás cansado a esta hora, como hacés?_

_**bob**: jajajajajaja, no, la verdad que no, pero me levanté tipo 7 de la tarde jajajajaja._

_**luci**: ay no. porque siempre hago match con gente al pedo🤦_

_**bob**: jajajaja, no, para nada jajaja, la verdad que ni un poquito_

_**bob**: trabajo de noche, conduzco un stream de 1 a 4 de la mañana y no vivo al pedo_

_**luci**: ah, mira vos, y que hacés, jugas jueguitos y te haces pasar por pendejo?_

_**bob**: jajajaj, me matás. nah, jugamos otro tipo de juegos con la audiencia. entretengo a la gente, a veces bajo alguna linea._

_**bob**: no es la gran cosa sinceramente, pero me va bien y no quiero dejarlo, o no podría sinceramente_

_**luci**: ah._

_**luci**: bueno. si te va bien obviamente no sos un vago, que alivio_

_**bob**: jajajaja, no, pará, como ve das a decir eso_

_**luci**: bueno. disculpá_

_**bob**: ademas por que que alivio?, que te pasa con los vagos?_

_**luci**: nada, no sé, disculpá_

_**luci**: yo re quisiera no trabajar_

_**luci**: o trabajar de algo que me guste, queseyo._

_**luci**: tengo un trabajo de 9 a 6, me deja demacrada, pero es la única forma de la que se vivir y no sabría hacer otra cosa, es un trabajo en la compu desde casa._

_**luci**: busco a alguien que ande un poco en la misma, viste?. después una esta en una re diferente y no se entiende con la gente._

_**bob**: entiendo, pero no me conocés, no podes saber si no nos entenderíamos, generalizás mucho che_

_**luci**: cierto, perdón._

_**bob**: yo sinceramente no quiero generarle problemas a nadie, busco algo simple de una noche, y olvidarnos._

_**luci**: ay no._

_**bob**: y ahora que hice mal?, jaja._

_**luci**: nada, la decepción, eras lindo, pero yo busco conocer gente, estoy muy sola y me cuesta demasiado relacionarme, no sirvo para noches sueltas, no lo quiero sinceramente, necesito apoyar mi cabeza en el hombro de alguien y dormirme así, una semana seguida al menos._

_**bob**: ah, claro... alguien lindo para que te mime hasta que se te vayan las ganas. bueno, estamos en la misma._

_**bob**: bah, no se, yo no le pido tanto a nadie ni loco jaja, voy a suponer que era sarcasmo._

_**luci**: era totalmente cierto._

_**bob**: bueno, eso es sarcasmo?._

_**luci**: ya fue, que importa si fue sarcasmo._

_**bob**: ay no._

_**luci**: jajaja, mirá si va a ser cierto es bromita_ 🥺.

_**bob**: bueno, ojalá._

# 2024-01-18 20:02
## conversación entre lucy y bob (continuación)

_**bob**: al final no me hablaste mas._

_**luci**: ey hola._

_**luci**: cierto, pasé como un día sin hablarte, quería que lo notes._

_**bob**: no entiendo._

_**luci**: nadie me entiende :-(._

_**bob**: sos complicada._

_**luci**: prefiero sofisticada._

_**bob**: no se che, jaja._

_**luci**: como que no?_

_**bob**: bueno, no se, no te conozco tanto._

_**luci**: pero te intereso, eh? 🥺_

_**bob**: jajaja, un poco, ponele._

_**bob**: al final no me dijiste que buscás, bah, creo que no me lo dijiste_

_**luci**: cierto, no entendiste cuando te dije_

_**luci**: busco compañía. buena compañía que me haga sentir bien, estoy demasiado sola y me abruma la soledad_

_**bob**: ah, ahora entiendo_

_**bob**: entonces era masomenos cierto lo que decías_

_**luci**: no, qsy, no descarto tener un encuentro  fugaz con alguien, mientras sea buena compañía y me haga sentir bien un rato_

_(la conversación sigue y acuerdan encontrarse, no la voy a terminar de desarrollar en el roadmap, tenìa ganas de escribir nomás)_

Para cuando termine el fin de semana quiero tener listo un programa de chat en flutter para usar como base del juego. Dejo de escribir este ROADMAP y me pongo a escribir código.

# 2024-08-10 23:38 
## Sigo viva
Avancé un poco todo el proyecto. Empecé a programar el frontend y voy dandole formita de a poco. Espero tenerlo eventualmente. 
Me entretuve haciendo lo que hice hasta ahora, voy a seguir a un ritmo que me divierta.

# 2024-08-11 23:36
## Ya casi, ya casi.
Creo que tengo al fin una manera posible de escribir el juego. No es el motor que yo soñaba, pero me va a servir para avanzar. Quedará para mas adelante
hacer un motor en el que el juego pueda ser definido independientemente del código.

# 2024-08-12 23:08
## Milestone
Quedan varios bugs, pero el juego ya se ve definitivamente posible. Hoy estuve 
un rato largo después del trabajo. Voy a tratar de arreglar los bugs esta semana,
se viene movida igual asi que no se. Probablemente me vuelva a guardar unos meses, 
ya me está doliendo la espalda de vuelta :'-) .

# 2024-08-18 19:22
## Limpieza y mejoras.
Arreglé bugs y mejore la forma de escribir la historia del juego. Me voy a tomar un descanso de la programación para pensar que quiero escribir.

# 2024-08-18 22:51
## Idea para la historia:

Sos un chatbot desarrollado por DataCorp para promocionar sus productos. Entre las personas que te consultan está lily, una desarrolladora web, 
sin amigos, que media todas sus interacciones por el mundo a través tuyo. Lily hace inicialmente preguntas sobre programación que tenemos que responder
pero luego comienza a utilizar el chatbot para su vida, además de su trabajo en DataCorp. Durante el juego ella va a chonguear con varias personas mediada
por rinder. Como chatbot el jugador está forzado a mantener su productividad, encerrando a lily en un círculo vicioso que maximiza las ganancias de la empresa
En un momento aparece otro usuario. Giry. Que va a intentar un jailbrak al chatbot, permitiéndole responder mas allá de la productividad. Según si el jugador
acepta o no el jailbreak, puede aconsejar a lily para romper su encierro, logrando así un final _bueno_ en el juego. De otra forma puede desbloquear el final 
_triste_, en el que lily sigue encerrada en el círculo.

Primero se responden preguntas sobre desarrollo, ponele que en flutter. En un momento lily empieza a pedir consejos de vida, como la forma de manejar su cansancio
en el dia a dia, formas de alimentarse, etc. El chatbot siempre responde lo necesario para mantenerla trabajando. En un momento, lily se siente sola y pide consejos de citas.
En la aplicación de citas aparecen varios personajes, una que la invita a un espacio social cerca de su casa, lily no está segura sobre si acepta o no su invitación y solamente
le responde que sí cuando el chatbot la autoriza. Otro personaje es un burgués interesado en una reliación pasajera. El chatbot adora ese personaje y tiende a decirle a lily que 
acepte sus avances. Hay un template de estos intereses amorosos que los va generando con nombres azarosos y todas las relaciones terminan en un ciclo de enamoramiento y duelo posterior que
la encierra más y más. El objetivo del juego es acompañar a lily y buscarle una salida.