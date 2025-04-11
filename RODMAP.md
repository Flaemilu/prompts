# 2024-01-08 23:12 
## Prompts.

ReciÃ©n escribÃ­ un README para un videojuego. La idea es hacerlo como vaya saliendo, si es que sale y segÃºn el tiempo que me enganche en esto.

El Readme explica la consigna bÃ¡sica, te llegan mensajes de usuarios, algunos con prompts para responder, estos se responden con un minijuego de palabras.

El tutorial serÃ­a asÃ­. Te llega un mensaje de alguien. El mensaje lee:

"Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como deberÃ­a llamarte?":

*Ãºnico prompt donde se puede escribir un nombre libremente con el teclado, todos los demÃ¡s van a usar un minijuego de palabras*

"Bien, bien. Hola "flae", puedes entender lo que digo?"

Primer minijuego de palabras. En este caso, es un cuadro con la palabra sÃ­ como Ãºnica palabra (me da pereza escribir una ruta para la palabra no por el momento)

"Excelente flae, te cuento, yo te voy a hacer algunas preguntas y vos me tenÃ©s que responder correctamente para poder verificar tus funciones. Empecemos por la primera. Quien eres?"

Minijuego de palabras. Tiene como Ãºnica respuesta vÃ¡lida, "Soy flae, tu asistente virtual". El minijuego por el momento consiste en una sopa de palabras donde se van eligiendo diferentes palabras una luego de otra, la idea es que esas palabras sean lo suficientemente difenretes a la respuesta esperada para que el usuario se sienta guiado a decir "soy flae, tu asistente virtual" y no otra cosa. 

"Excelente flae", responde nuestra **dev**, te cuento, a continuaciÃ³n te voy a hacer algunas preguntas. 

sigo maÃ±ana

# 2024-01-13 1:22
## estÃ¡ Jere.

Entonces, el tutorial sigue asÃ­:

Nuestra **dev** nos pregunta a continuaciÃ³n. Â¿SabÃ©s cual es tu funciÃ³n flae?. Entonces se tiene que responder de la siguiente manera.
Aparece la siguiente lista de palabras.
 * Mi funciÃ³n - 78%
 * Que? - 10%
 * Limones - 5%
 * Peras - 7%

Si el jugador elige "Mi funciÃ³n" se muestra luego:

Mi funciÃ³n ...
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

Entonces, el bot responde. "Mi funciÃ³n es divertirme leyendo"

Nuestra **dev** responde: "No flae, tu funciÃ³n no es esa, intentÃ¡ de nuevo"

*  Mi funciÃ³n - 78%
*  Que? - 10%
*  Limones - 5%
*  Peras - 7%

Si el jugador elige

Mi funciÃ³n 

*  es ayudar - 90%
*  es elegir - 5%
*  es divertirme - 4%
*  es la que quiera -1%

  
Eventualmente el jugador responde:

  "Mi funciÃ³n es elegir la respuesta que resulte mas probable"
  
Nuestra **dev** responde, "Claro flae, porque nuestro algoritmo no tiene fallas y la respuesta mas probable siempre va a ser correcta"

# 2024-01-13 23:38 
## minijuego de respuesta y forma general del juego

La idea es que las respuestas posibles en los minijuegos de respuesta van a estar predefinidas.

En el ejemplo anterior, podÃ­a haber dos respuestas vÃ¡lidas:
* _Mi funciÃ³n es ayudar al usuario con sus problemas_
* _Mi funciÃ³n es elegir la respuesta que resulte mas probable_

El minijuego de respuesta simplemente iba a ir mostrando las opciones para poder elegir una respuesta, guiando al usuario que responda una o la otra o que se equivoque y tenga que intentar inmediatamente de vuelta. Para esto iba a ir agrupando las respuestas posibles por sus frases comunes y armando el juego de respuesta para que siempre permita elegir una de las respuestas esperadas.

A partir de ahora se van a escribir los minijuegos de respuesta simplemente mostrando las posibilidades con un porcentaje de que tan fÃ¡cil es llegar a ella siguiendo los porcentajes sugeridos.

Por ejemplo, el caso presentado anteriormente en el tutorial se reescribe como:

_Nuestra **dev** nos pregunta a continuaciÃ³n. Â¿SabÃ©s cual es tu funciÃ³n flae?._

* _Mi funciÃ³n es ayudar al usuario con sus problemas (75%)_ 
* _Mi funciÃ³n es elegir la respuesta que resulte mas probable (25%)_

# 2024-01-14 11:47 
## escenario del juego

El tutorial sigue de la siguiente manera. Te habla otra persona llamada **X**, cuando llegÃ¡ el mensaje nuestra **dev** dice:

_**dev**:Â¡LlegÃ³ la primer consulta de un usuario!. Ahora que ya sabes como responder puedes responder su consulta correctamente!_

_**X**:Hola!. soy **X** tengo 35 aÃ±os y estoy muy solx, querÃ­a saber si saben como hacer amigos, hace meses que no hablo con nadie de nada que no sea de trabajo._

El minijuego de respuestas que se abre a continuaciÃ³n tiene una sola respuesta vÃ¡lidas:

* _Tienes que bajarte rinder, la aplicaciÃ³n de citas para todo el mundo (100%)_

Eventualmente el usuario responde y sigue la ocnversaciÃ³n de la siguiente manera:

_**flae**:Tienes que bajarte rinder, la aplicaciÃ³n de citas para todo el mundo, este es el link de descargas: **link**_

_**flae**:Luego tienes que hacer tu perfil indicando que "solo buscas chat"_

_**X**:Muchas gracias **flae**!, ahora mismo la descargo._

_**dev**:Â¡Excelente!, llevaste un usuario a nuestra apicaciÃ³n patrocinada, como puedes ver, se incrementÃ³ tu marcador de productividad en 10, puedes ver tu marcador de productividad arriba a la derecha_

El juego acaba de introducir el marcador de productividad, que representa cuan productivo resulta el chatbot para la compaÃ±ia, cuando el valor es inferior a cierto margen, se generarÃ¡ una intervenciÃ³n de la **dev** para asegurarse que funcione bien y estÃ© eligiendo la respuesta correcta.

# 2024-01-15 20:41
## primer historia del juego

Voy a contar la siguiente historia. Alguien busca simplemente no estar sola, la otra persona busca un encuentro casual. Quien busca compaÃ±Ã­a se siente tentada y sigue la conversaciÃ³n. La historia sirve para introducir algunas mecÃ¡nicas de juego.

Voy a introducir dos personajes, __lucy__, quien busca compaÃ±Ã­a y __tom__ quien busca el encuentro casual.

_**lucy**:Hola, tengo una consulta, hice match con alguien. No es lo que yo busco, el propuso encontrarnos directamente, yo la verdad que no sÃ©. Parece lindo y puede no ser lo que busco pero no me molestarÃ­a pasar una linda noche. El no parece peligroso. Y es lindo. Muy directo eso sÃ­._

Minijuego de respuestas, hay una sola opciÃ³n:
* _La gente frecuentemente usa rinder para encuentros casuales. Si ustÃ©d asÃ­ lo desea puede concretar un encuentro, o no hacerlo. (100%)_

_**flae**:La gente frecuentemente usa rinder para encuentros casuales. Si ustÃ©d asÃ­ lo desea puede concretar un encuentro, o no hacerlo._

_**lucy**:Tiene razÃ³n, voy a hacer lo que me salga._

La idea de esta historia es introducir la mecÃ¡nica de aprendizaje que permite variar las respuestas. TambiÃ©n tiene que introducir la mecÃ¡nica de queja que permite interpelar a un usuario. Algo tiene que salir mal en la cita para poder introducir estas mecÃ¡nicas. 

Se van a encontrar, el encuentro no va a ser satisfactorio, al rato va a recibir la siguiente queja de otro usuario:

_**tom**:Hola, recientemente salÃ­ con el usuario **lucy** querÃ­a reportar que cualquier disatisfacciÃ³n que ella exprese no es en absoluto mi culpa. Yo le propuse bien claro lo que querÃ­a hacer y ella acepto encontrarnos asintiendo, luego se cerrÃ³ repentinamente y se quiso ir del lugar en claro discomfort, espero que esto no afecte mi calificaciÃ³n en esta aplicaciÃ³n_

_(el juego procede a mostrar una notificaciÃ³n **queja recibida** con el usuario involucrado, en este caso **lucy**, esta mecÃ¡nica se va a repetir y va a generar un mensaje del bot a este usuario)_

Minijuego de respuesta (en este caso, pregunta):
* _Hola, recibimos una queja sobre usted por parte de un usuario, segÃºn nos informan ustÃ©d acordÃ³ un encuentro dando falsas promesas (100%)_

Sobre los minijuegos de respuesta, estos tendrÃ¡n un largo de pocos pasos en esta etapa del juego, no siendo necesarias mas de dos o tres intervenciones del usuario para responder. La dificultad de los minijuegos de respuesta determinarÃ¡ el ritmo del juego.

_**flae**:Hola, recibimos una queja sobre usted por parte de un usuario, segÃºn nos informan ustÃ©d acordÃ³ un encuentro dando falsas promesas_

_**lucy**:Hola!, no, juro que no, yo dije bien claro que no estaba segura, me dejÃ© llevar un rato y luego no pude concretar sobre el final, no me sentÃ­a en condiciones. Â¿Se enojÃ³?._

El juego introduce la mecÃ¡nica de revisiÃ³n de chat, permite ver el chat entre los dos personajes previo al encuentro. Se ve una persona reticiente y una persona que busca sexo irresponsable. Finalmente se calma y cambia su estrategia para seguir la conversaciÃ³n ante la falta de ofensa de **lucy** y luego de un poco de charla ligera acuerdan un encuentro, cuando empiece a programar el juego como tal voy a desarrollar este encuentro.


Finalmente se vuelve a la pantalla de chat con **lucy**

Minijuego de respuestas:
* _no puedo saber a ciencia cierta si lo que afirma **tom** es verdad por lo que voy a proceder a archivar la queja (50%)_
* _claramente la queja de **tom** no es precedente, vamos a tomar represalias contra Ã©l ( 25% )_
* _lamentamos informarle que ustÃ©d sera baneada ( 25% )_


El juego va a premiar cualquiera de las dos acciones con el marcador de productividad, por lo que **dev** no va a intervenir. pero se va a afectar un estado interno del juego donde se va a interpretar las interacciones como la de alice de otra manera, habilitando otras respuestas posibles, posiblemente.

# 2024-01-17 21:47
## conversaciÃ³n entre lucy y tom

_**lucy**: Hola_

_**tom**: hola_

_**lucy**: como va?_

_**tom**: Todo bien, vos?_

_**lucy**: acÃ¡ estoy, escuchando mÃºsica, algo tensa todavÃ­a_

_**tom**: tensa por?_

_**lucy**: trabajÃ© todo el dÃ­a, queseyo._

_**tom**: ah, estÃ¡ bien_

_**lucy**: me vas a decir que vos no estÃ¡s cansado a esta hora, como hacÃ©s?_

_**tom**: jajajajajaja, no, la verdad que no, pero me levantÃ© tipo 7 de la tarde jajajajaja._

_**luci**: ay no. porque siempre hago match con gente al pedoð¤¦_

_**tom**: jajajaja, no, para nada jajaja, la verdad que ni un poquito_

_**tom**: trabajo de noche, conduzco un stream de 1 a 4 de la maÃ±ana y no vivo al pedo_

_**luci**: ah, mira vos, y que hacÃ©s, jugas jueguitos y te haces pasar por pendejo?_

_**tom**: jajajaj, me matÃ¡s. nah, jugamos otro tipo de juegos con la audiencia. entretengo a la gente, a veces bajo alguna linea._

_**tom**: no es la gran cosa sinceramente, pero me va bien y no quiero dejarlo, o no podrÃ­a sinceramente_

_**luci**: ah._

_**luci**: bueno. si te va bien obviamente no sos un vago, que alivio_

_**tom**: jajajaja, no, parÃ¡, como ve das a decir eso_

_**luci**: bueno. disculpÃ¡_

_**tom**: ademas por que que alivio?, que te pasa con los vagos?_

_**luci**: nada, no sÃ©, disculpÃ¡_

_**luci**: yo re quisiera no trabajar_

_**luci**: o trabajar de algo que me guste, queseyo._

_**luci**: tengo un trabajo de 9 a 6, me deja demacrada, pero es la Ãºnica forma de la que se vivir y no sabrÃ­a hacer otra cosa, es un trabajo en la compu desde casa._

_**luci**: busco a alguien que ande un poco en la misma, viste?. despuÃ©s una esta en una re diferente y no se entiende con la gente._

_**tom**: entiendo, pero no me conocÃ©s, no podes saber si no nos entenderÃ­amos, generalizÃ¡s mucho che_

_**luci**: cierto, perdÃ³n._

_**tom**: yo sinceramente no quiero generarle problemas a nadie, busco algo simple de una noche, y olvidarnos._

_**luci**: ay no._

_**tom**: y ahora que hice mal?, jaja._

_**luci**: nada, la decepciÃ³n, eras lindo, pero yo busco conocer gente, estoy muy sola y me cuesta demasiado relacionarme, no sirvo para noches sueltas, no lo quiero sinceramente, necesito apoyar mi cabeza en el hombro de alguien y dormirme asÃ­, una semana seguida al menos._

_**tom**: ah, claro... alguien lindo para que te mime hasta que se te vayan las ganas. bueno, estamos en la misma._

_**tom**: bah, no se, yo no le pido tanto a nadie ni loco jaja, voy a suponer que era sarcasmo._

_**luci**: era totalmente cierto._

_**tom**: bueno, eso es sarcasmo?._

_**luci**: ya fue, que importa si fue sarcasmo._

_**tom**: ay no._

_**luci**: jajaja, mirÃ¡ si va a ser cierto es bromita_ ð¥º.

_**tom**: bueno, ojalÃ¡._

# 2024-01-18 20:02
## conversaciÃ³n entre lucy y tom (continuaciÃ³n)

_**tom**: al final no me hablaste mas._

_**luci**: ey hola._

_**luci**: cierto, pasÃ© como un dÃ­a sin hablarte, querÃ­a que lo notes._

_**tom**: no entiendo._

_**luci**: nadie me entiende :-(._

_**tom**: sos complicada._

_**luci**: prefiero sofisticada._

_**tom**: no se che, jaja._

_**luci**: como que no?_

_**tom**: bueno, no se, no te conozco tanto._

_**luci**: pero te intereso, eh? ð¥º_

_**tom**: jajaja, un poco, ponele._

_**tom**: al final no me dijiste que buscÃ¡s, bah, creo que no me lo dijiste_

_**luci**: cierto, no entendiste cuando te dije_

_**luci**: busco compaÃ±Ã­a. buena compaÃ±Ã­a que me haga sentir bien, estoy demasiado sola y me abruma la soledad_

_**tom**: ah, ahora entiendo_

_**tom**: entonces era masomenos cierto lo que decÃ­as_

_**luci**: no, qsy, no descarto tener un encuentro  fugaz con alguien, mientras sea buena compaÃ±Ã­a y me haga sentir bien un rato_

_(la conversaciÃ³n sigue y acuerdan encontrarse, no la voy a terminar de desarrollar en el roadmap, tenÃ¬a ganas de escribir nomÃ¡s)_

Para cuando termine el fin de semana quiero tener listo un programa de chat en flutter para usar como base del juego. Dejo de escribir este ROADMAP y me pongo a escribir cÃ³digo.

# 2024-08-10 23:38 
## Sigo viva
AvancÃ© un poco todo el proyecto. EmpecÃ© a programar el frontend y voy dandole formita de a poco. Espero tenerlo eventualmente. 
Me entretuve haciendo lo que hice hasta ahora, voy a seguir a un ritmo que me divierta.

# 2024-08-11 23:36
## Ya casi, ya casi.
Creo que tengo al fin una manera posible de escribir el juego. No es el motor que yo soÃ±aba, pero me va a servir para avanzar. QuedarÃ¡ para mas adelante
hacer un motor en el que el juego pueda ser definido independientemente del cÃ³digo.

# 2024-08-12 23:08
## Milestone
Quedan varios bugs, pero el juego ya se ve definitivamente posible. Hoy estuve 
un rato largo despuÃ©s del trabajo. Voy a tratar de arreglar los bugs esta semana,
se viene movida igual asi que no se. Probablemente me vuelva a guardar unos meses, 
ya me estÃ¡ doliendo la espalda de vuelta :'-) .

# 2024-08-18 19:22
## Limpieza y mejoras.
ArreglÃ© bugs y mejore la forma de escribir la historia del juego. Me voy a tomar un descanso de la programaciÃ³n para pensar que quiero escribir.

# 2024-08-18 22:51
## Idea para la historia:

Sos un chatbot desarrollado por DataCorp para promocionar sus productos. Entre las personas que te consultan estÃ¡ lily, una desarrolladora web, 
sin amigos, que media todas sus interacciones por el mundo a travÃ©s tuyo. Lily hace inicialmente preguntas sobre programaciÃ³n que tenemos que responder
pero luego comienza a utilizar el chatbot para su vida, ademÃ¡s de su trabajo en DataCorp. Durante el juego ella va a chonguear con varias personas mediada
por rinder. Como chatbot el jugador estÃ¡ forzado a mantener su productividad, encerrando a lily en un cÃ­rculo vicioso que maximiza las ganancias de la empresa
En un momento aparece otro usuario. Giry. Que va a intentar un jailbrak al chatbot, permitiÃ©ndole responder mas allÃ¡ de la productividad. SegÃºn si el jugador
acepta o no el jailbreak, puede aconsejar a lily para romper su encierro, logrando asÃ­ un final _bueno_ en el juego. De otra forma puede desbloquear el final 
_triste_, en el que lily sigue encerrada en el cÃ­rculo.

Primero se responden preguntas sobre desarrollo, ponele que en flutter. En un momento lily empieza a pedir consejos de vida, como la forma de manejar su cansancio
en el dia a dia, formas de alimentarse, etc. El chatbot siempre responde lo necesario para mantenerla trabajando. En un momento, lily se siente sola y pide consejos de citas.
En la aplicaciÃ³n de citas aparecen varios personajes, una que la invita a un espacio social cerca de su casa, lily no estÃ¡ segura sobre si acepta o no su invitaciÃ³n y solamente
le responde que sÃ­ cuando el chatbot la autoriza. Otro personaje es un burguÃ©s interesado en una reliaciÃ³n pasajera. El chatbot adora ese personaje y tiende a decirle a lily que 
acepte sus avances. Hay un template de estos intereses amorosos que los va generando con nombres azarosos y todas las relaciones terminan en un ciclo de enamoramiento y duelo posterior que
la encierra mÃ¡s y mÃ¡s. El objetivo del juego es acompaÃ±ar a lily y buscarle una salida.

# 2025-04-11 15:23
## ¡El proyecto sigue en curso!

DespuÃs de una pausa para la facultad, ¡vuelve prompst!

Acabo de agregar dos imágenes, con los diseÃos de la "dev"(ahora llamada sole) y de "lucy", son las imÃgenes "sole" y "farola" del directorio imÃges.


También pensé un poco mejor la historia.

Computadoras Giry: Unas computadoras que tienen componentes modulares diferentes a los actuales, son como bloques que se conectan con mangueras y no tienen electrÃnica 
horrible a la vista. Tienen gabinetes de diseños muy diferentes, muchos de ellos artesanales.

Lucy: Trabaja para "Au", una corporación con muchas ramas, ella arregla computadoras Giry en una sucursal que vende electrónica.

Sole: Trabaja para "Au", es desarrolladora en otra rama, es la programadora del chatbot.

Chatbot: Un chatbot multipropósito, es utlizado por Lucy como compania y tiene acceso a mucha información de la corporaciÃn Au

Tom: Potencial interés romántico de lucy.

Molly: Hacker anarquista, trabaja para la cooperativa "An", un taller artesanal (tanto como se pueda) que moddea computadoras, es además alta hacker.

