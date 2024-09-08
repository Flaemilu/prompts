import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/events/event.dart';
import 'package:prompts/prompts/controller/events/eventmanager.dart';
import 'package:prompts/prompts/model/answeringminigame.dart';
import 'package:prompts/prompts/model/entities/answer.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/game/game.dart';
import 'package:prompts/prompts/model/gamestate.dart';
import 'package:prompts/prompts/lib/maybe.dart';
import 'package:prompts/prompts/lib/pair.dart';

class ChatController {
  
  Game game;
  ChatController(this.game);
  ScrollController scrollController = ScrollController();

  String getChatName(){
    return game.person;
  }

  List<Pair<String,String>> getChats(){
    return game.state.getChats(getChatName()).map(
      (m) => Pair(m.person.personName, m.content.replaceAll("#{name}", Game.bot.personName)) //revisar la forma de tener un mapa de variables
    ).toList();
  }

  int getUnread(){
    return game.state.getChats(getChatName()).fold(0, (n, chat) => n + (!chat.read?1:0));
  }

  AnswerMessage? getAnswer(){
    return game.state.getAnswer(this.getChatName());
  }

  void pickAnswer(String label, String id) {
    EventManager.instance.fireEvent(
      UserPickAnswer(id, label)
    );
  }

  void nextMessage() {
    EventManager.instance.fireEvent(
      UserNextMessage()
    );
  }
  
  void markRead(){
    game.markRead(getChatName());
  }
}