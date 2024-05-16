class Game{
  /*
    El juego es símplemente recorrer un arbol de respuestas. 
    El juego desarrollado a al 20 de enero tiene la siguiente forma
    
    -inicio
    -primer desicion, si bannear a lucy o a bob
    -chat de bob con lily       - chat de lucy con bill
    -final de bob                  -final de lucy.

    el siguiente pseudocòdigo se utilizarà para describir el juego
    
    var prompts = new Game();
    prompts.define(
        "begin_prompts", //label de la escena, es un nombre sin significado para identificarla
        [
          incoming["dev", "Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como debería llamarte?"],
          input["botname"],
          incoming["dev", "Bien, bien. Hola "flae", puedes entender lo que digo?"],
          answeringMiniGame[{
            "entiende":"Si" //la clave del mapa es el label de juego que sigue luego, el texto es la respuesta que lo genera
            "noentiende":"No"
          }] //
        ]
    );

    //ahora prompts tiene un label "prompts" que sirve de raìz, y branchea a dos nodos aún no definidos.

    sigo definiendo 
    prompts.define(
      "noentiende",
      [
        incoming["dev", "Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como debería llamarte?""],
          answeringMiniGame[{
            "entiende":"Si" 
            "noentiende":"No" //referencia circular que define un bucle
          }] 
      ]

    prompts.define(
      "entiende",
      [
        incoming["dev", "Excelente flae, te cuento, yo te voy a hacer algunas preguntas y vos me tenés que responder correctamente para poder verificar tus funciones. Empecemos por la primera. Quien eres?"],
        answeringMiniGame[{
            "_next":""Soy flae, tu asistente virtual"" //_next es una clave que indica que el juego sigue linearmente, está reservada, ver tipos enumerados para las claves, con una estructura tipo Next | Call <clave>
        }],
        incoming["dev", ""Excelente flae""],

      ]
    )


    se está definiendo un grafo dirigido con esa sintaxis, con una forma ligeramente de arbol pero no necesariamente,
    puede haber bucles.


  */
}