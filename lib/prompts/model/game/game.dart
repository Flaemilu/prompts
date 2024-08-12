import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/action.dart';
import 'package:prompts/prompts/model/game/rule.dart';
import 'package:prompts/prompts/model/gamestate.dart';

class Game{
  Set<String> estados = {"START_GAME"};
  Set<GameRule> reglas = {};
  GameState state = GameState();
  static Person bot = Person(IdGenerator.nextId(),"bot");
  static Person dev = Person(IdGenerator.nextId(), "dev");
  static Person luci = Person(IdGenerator.nextId(), "luci");
  
  Game(){
    reglas.addAll([
      WhenRule(
        (state)=>!state.persons.contains(dev),
        [
          MessageAction(Message(dev, -1, "Hola bot, soy tu dev, entendes lo que digo?")),
          AnswerAction({
            "si":MessageAction(Message(dev, -1, "si", label:"BOT_ENTIENDE")),
            "no":MessageAction(Message(dev, -1, "no", label:"BOT_NO_ENTIENDE"))
          })
        ]
      ),
      WhenRule(
        (state) => !state.messages.any((m) => m.messageLabel == "BOT_ENTIENDE"),
        [
          MessageAction(Message(dev, -1, "Hola bot, soy tu dev, entendes lo que digo?")),
          AnswerAction({
            "si":MessageAction(Message(dev, -1, "si", label:"BOT_ENTIENDE")),
            "no":MessageAction(Message(dev, -1, "no", label:"BOT_NO_ENTIENDE"))
          })
        ]
      )
    ]);
  }
}