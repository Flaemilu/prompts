import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/events/event.dart';
import 'package:prompts/prompts/controller/events/eventhandler.dart';
import 'package:prompts/prompts/controller/events/eventmanager.dart';
import 'package:prompts/prompts/model/answeringminigame.dart';
import 'package:prompts/prompts/model/game.dart';
import 'package:prompts/prompts/model/maybe.dart';
import 'package:prompts/prompts/model/pair.dart';
import 'package:prompts/prompts/model/person.dart';

class ChatController {
  
  Game game;
  ChatController(this.game);

  String getMyName(){
    return "dev";
  }

  List<Pair<String,String>> getChats(){
    return [
      Pair("dev", "Hola, soy tu **dev** asignada, vamos a verificar tus funciones, como debería llamarte?"),
      Pair("flae","flae"),
      Pair("dev","Bien, bien. Hola **flae**, puedes entender lo que digo?"),
    ];
  }

  Maybe<AnsweringMiniGame> answer(){
    return Just(AnsweringMiniGame(["si", "no", "karacoles 🐌"], Person(1), ["si", "no", "karacoles 🐌"]));
  }

  void pickAnswer(int id) {
    EventManager.instance.fireEvent(
      UserPickAnswer(id)
    );
  }

  void nextMessage() {
    EventManager.instance.fireEvent(
      UserNextMessage()
    );
  }
  
}