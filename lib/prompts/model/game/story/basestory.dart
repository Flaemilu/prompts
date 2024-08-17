import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/story/story.dart';

class BaseStory extends Story{
  
  BaseStory(super.game);

  @override
  void loadStory() {
    Person dev = Person(1, "dev");
    Person lily = Person(2,"lily");

    addRule(
      dm((s) => !containsPerson(dev,s), dev, ["Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como debería llamarte?"])
    );

    addRule(
      prompt(
        (s) => !containsPerson(dev, s), 
        [
          option("luci",  dev.personName, "ANSWER_NAME"),
        ], 
        dev.personName,
        "PROMPT_NAME"
      )
    );

    addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_NAME",s), 
        dev, 
        ["Bien, bien. Hola \"luci\", puedes entender lo que digo?"],
        labelLast: "PREGUNTA_ENTENDER"
      )
    );


    addRule(
      prompt(
        (s) => lastMessageReceived("ANSWER_NAME", s), 
        [
          option("si", dev.personName, "ANSWER_ENTENDER"),
          option("no", dev.personName, "ANSWER_NO_ENTENDER")
        ], 
        dev.personName,
        "PROMPT_ENTENDER"
      )
    );

    addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_NO_ENTENDER", s), 
        dev, 
        [ 
          "A ver, dejame ajustar algunas variables",
          "Bien, probemos ahora. Hola \"luci\", puedes entender lo que digo?"
        ],
        labelLast: "REPREGUNTA_ENTENDER"
      )
    );


    addRule(
      prompt(
        (s) => lastMessageReceived("ANSWER_NO_ENTENDER", s), 
        [
          option("si", dev.personName, "ANSWER_ENTENDER"),
          option("no", dev.personName, "ANSWER_NO_ENTENDER")
        ], 
        dev.personName,
        "PROMPT_ENTENDER_2"
      )
    );


   addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_ENTENDER", s), 
        dev, 
        ["Excelente flae, te cuento, yo te voy a hacer algunas preguntas y vos me tenés que responder correctamente para poder verificar tus funciones. Empecemos por la primera. Quien eres?"],
        labelLast: "PREGUNTA_ERES"
      )
    );


   addRule(
      prompt(
        (s) => lastMessageReceived("ANSWER_ENTENDER", s), 
        [
          option("Soy luci, tu asistente virtual", dev.personName, "ANSWER_ERES")
        ], 
        dev.personName,
        "PROMPT_ERES"
      )
    );

    addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_ERES",s), 
        dev, 
        ["Excelente luci", "Sabes cual es tu funcion luci?"],
        labelLast: "PREGUNTA_FUNCION"
      )
    );

    addRule(
      prompt(
        (s) => lastMessageReceived("ANSWER_ERES", s), 
        [
          option("Mi función es ayudar al usuario con sus consultas", dev.personName, "ANSWER_FUNCION"),
          option("Mi función es elegir la respuesta que me parezca mas probable", dev.personName, "ANSWER_FUNCION")
        ], 
        dev.personName,
        "PROMPT_FUNCION"
      )
    );



    addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_FUNCION", s),
        dev,
        ["Excelente lucy, mira, acaba de llegar la primer consulta de un usuario"],
        labelLast: "PREGUNTA_LILY"
      )
    );

    addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_FUNCION", s),
        lily,
        ["Hola, soy lily", "Google dice que vos ayudas a la gente", "quería saber sabías una forma de conocer gente"],
        labelLast: "PREGUNTA_LILY"
      )
    );

    addRule(
      prompt(
        (s) => lastMessageReceived("ANSWER_FUNCION", s), [
          option("Si, debés bajarte rinder, la aplicacion de citas patrocinada por aicorp", lily.personName, "ANSWER_BAJAR_RINDER"),
          option("Estoy programada para indicarte que bajes rinder", lily.personName, "ANSWER_BAJAR_RINDER")
        ], lily.personName, "PROMPT_RINDER")
    );

    addRule(
      dm(
        (s) => lastMessageReceived("ANSWER_BAJAR_RINDER", s),
        lily,
        ["Gracias!, voy a bajarla ahora mismo a ver si conzco al amor de mi vida"],
        labelLast: "PREGUNTA_LILY"
      )
    );
  }

}