import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/game.dart';
import 'package:prompts/prompts/model/game/story/story.dart';

class BaseStory extends Story{
  
  BaseStory(super.game);

  @override
  void loadStory() {
    Person dev = Person(IdGenerator.nextId(), "dev");
    
    sayFirst(dev, ["Hola, dejame presentarme, soy tu dev, trabajo para DataCorp, acabas de ser activada", "Sos un bot de DataCorp, primero que nada, como deberìa ser tu nombre?"], "PREGUNTA_NOMBRE");
    pickName((s)=>!s.persons.contains(dev), ["luci", "lily"], "NOMBRE_ELEGIDO");
    
    personSaysAfter(dev, ["Hola, #{name}, un gusto", "sabès cual es tu funciòn?"], "NOMBRE_ELEGIDO", "PREGUNTA_FUNCION");
    promptChatAfter(
      {
        "FUNCION_AYUDAR": "Mi funcion es ayudar al usuario",
        "FUNCION_ADIVINAR" :"Mi funciòn es elegir la respuesta que me parezca mas probable"
      },
      dev.personName,
      "NOMBRE_ELEGIDO",
      "RESPUESTA_FUNCION"
    );
  }


}