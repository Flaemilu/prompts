class Game{
  /*
    El juego es símplemente recorrer un arbol de respuestas. 
    El juego desarrollado a al 20 de enero tiene la siguiente forma
    
    -inicio
    -primer desicion, si bannear a lucy o a bob
    -chat de bob con lori       - chat de lucy con bill
    -final de bob                  -final de lucy.

    Entonces, La historia de va a componer de escenas que se conectan entre sí
    como si fuera un arbol, sólo que el jugador recorre un camino dentro del arbol
    para completar su historia.

    Entonces, quien escribe el juego va a ir escribiendo escenas de la siguiente 
    manera:

        Una escena consiste en un setup seguido por un minijuego de respuestas,
      entonces se construyen mediante un builder con la siguiente forma:
        val inicio = [
          prompt(new Prompt(
            dev,
            "Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como debería llamarte?"
          ),
          nameChooser("botname")
        ]
        val entiendeMinigame = 
        [
          prompt(new Prompt(
            dev,
            ""Bien, bien. Hola "{{botname}}", puedes entender lo que digo?"
          ),
          answeringMinigame(
            <constructor de un minijuego con si o no>
            [null, entiendeMinigame] 
            //si significa que se avanza normalmente, por eso null, no hay branching,
            //mientras que no vuelve a preguntar, por eso lleva a la misma escena.
          ),
          prompt(new Prompt(
            dev,
            ""Bien, bien. Hola "{{botname}}", puedes entender lo que digo?"
          )
        ]
        val escena = Escena.sumar([inicio, nombreMiniGame]);

      Ese código declarará una escena. Entonces, una escena es una lista de "NodosEscena"
      que pueden tener varios tipos. Uno puede ser un prompt para mostrar, otro un minijuego
      de respuestas con dos outcomes posibles (tambien NodosEscena) , otro puede
      ser el minijuego de elegir el nombre. Una Lista de escenas es también vista 
      como una escena, pero para convertir una o mas listas de escenas en una escena
      se usa la funcion de argumento variable Escena.sumar(List<List<Escena>> escenas)


      

    Esto va a terminar definiendo un camino donde se van encadenando escenas.
  */
}