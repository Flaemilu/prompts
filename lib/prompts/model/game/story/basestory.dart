import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/game.dart';
import 'package:prompts/prompts/model/game/story/story.dart';

class BaseStory extends Story{
  
  Person dev = Person(IdGenerator.nextId(), "dev");
  Person mili = Person(IdGenerator.nextId(), "mili");
  
  BaseStory(super.game);

  @override
  void loadStory() {
    sayFirst(dev, ["Hola, dejame presentarme, soy tu dev, trabajo para DataCorp, acabas de ser activada", "Sos un bot de DataCorp, primero que nada, como deberìa ser tu nombre?"], "PREGUNTA_NOMBRE");
    pickName((s)=>!s.persons.contains(dev), ["luci", "lily"], "NOMBRE_ELEGIDO");
    
    personSaysAfter(dev, ["Hola, #{name}, un gusto", "sabès cual es tu funciòn?"], ["NOMBRE_ELEGIDO"], "PREGUNTA_FUNCION");
    promptChatAfter(
      {
        "FUNCION_AYUDAR": "Mi funcion es ayudar al usuario",
        "FUNCION_ADIVINAR" :"Mi funciòn es elegir la respuesta que me parezca mas probable"
      },
      dev.personName,
      ["NOMBRE_ELEGIDO"],
      "RESPUESTA_FUNCION"
    );

    personSaysAfter(dev, ["Excelente!, buena suerte con eso."], ["FUNCION_AYUDAR"], "FUNCION_COMPLETADO");
    personSaysAfter(dev, ["Meh. Igual sirve, me conformo"], ["FUNCION_ADIVINAR"], "FUNCION_COMPLETADO");

    personSaysAfter(
      dev, 
      [
        "Menos mal que respondiste bien, hoy va a ser un día fácil.",
        "Bien, pasemos a lo importante", 
        "Primero, voy a enviarte un usuario para ver como te comportás",
        "Asistí a la próxima usuaria con su consulta"
      ], 
      ["FUNCION_AYUDAR", "FUNCION_ADIVINAR"], 
      "FUNCION_COMPLETADO"
    );

    personSaysAfter(
      mili,
      [
        "Hola, me llamo Milagros",
        "Estaba con un problema, no se si podrás ayudarme",
        "Anoche me tomé un vino y ahora me duele la cabeza, como decís que lo arregle?"
      ],
      ["FUNCION_AYUDAR", "FUNCION_ADIVINAR"], 
      "FUNCION_COMPLETADO"
    );

    promptChatAfter(
      {
        "RDC1": "El ibuprofeno ayuda",
        "RDC2" :"Tomá muxa awita y cuidate que DataCorp te kiere muchio <3"
      },
      mili.personName,
      ["FUNCION_AYUDAR", "FUNCION_ADIVINAR"], 
      "RESPUESTA_FUNCION"
    );

    personSaysAfter(
      mili,
      [
        "Ahura mismo te hago caso, ¡muchas gracias!"
      ],
      ["RDC1","RDC2"], 
      "FUNCION_COMPLETADO"
    );

    devTerminaDeTrabajar();
    
  }

  devTerminaDeTrabajar(){
    
    personSaysAfter(
      dev, 
      [
        "Bueno, el análisis dice que es una respuesta correcta",
        "Se vé que la gente ahora habla así",
      ], 
      ["RDC2"],
      ""
    );

    personSaysAfter(
        dev, 
        [
          "Simple y efectivo",
          "Excelente, con suerte me ayudas a cumplir mi cuota de productividad cuando toque"
        ], 
        ["RDC1"],
        ""
    );

    personSaysAfter(
      dev, 
      [
        "Bien, sobre la productividad",
        "Aún estamos desarrollando la forma de medirla",
        "Así que no te preocupes",
        "en fin...",
        "¿alguna pregunta?"
      ], 
      ["RDC1", "RDC2","RDC3"],
      ""
    );

    promptChatAfter(
      {
        "SIN_PREGUNTAS": "No",
      },
      dev.personName,
      ["RDC1", "RDC2","RDC3"],
      "PREGUNTA_PREGUNTAS"
    );

    personSaysAfter(
      dev, 
      [
        "Perfecto entonces",
        "En fin, te van a empezar a llegar mensajes.",
        "Yo terminé mi trabajo por hoy"
      ], 
      ["SIN_PREGUNTAS"],
      ""
    );


  }


}