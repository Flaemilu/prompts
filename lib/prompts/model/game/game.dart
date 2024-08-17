import 'package:flutter/material.dart';
import 'package:prompts/main.dart';
import 'package:prompts/prompts/controller/events/eventmanager.dart';
import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/action.dart';
import 'package:prompts/prompts/model/game/rule.dart';
import 'package:prompts/prompts/model/game/story/basestory.dart';
import 'package:prompts/prompts/model/gamestate.dart';

class Game{
  Set<String> estados = {"START_GAME"};
  Set<WhenRule> reglas = {};
  GameState state = GameState();
  State mainWidget;
  String person = "dev";
  static Person bot = Person(IdGenerator.nextId(),"bot");
  static Person luci = Person(IdGenerator.nextId(), "luci");
  
  
  Game(this.mainWidget){
    var story = BaseStory(this);
    story.loadStory();
    EventManager.instance.registerGame(this);
  }

  gameCycle(){
    debugPrint("Game cycle!");
    var activeRules = reglas.where((rule) => rule.canRun(state)).toList();
    activeRules.forEach(
      (rule) {
        rule.nextActions.forEach(
          (action) {
            switch(action){
              case MessageAction(message: Message m):
                state.newEvent(m);
                break;
              case AnswerAction(
                answerMap: Map<String, MessageAction> answerMap,
                chatId: String chatId,
                label: String label
              ):
                state.newEvent(
                  AnswerMessage(answerMap, bot, chatId, "", label:label)
                );
                break;
            }
          }
        );
      }
    );
  }

  answer(String label, String answer){
    var m = state.getMessageByLabel(label);
     if(m is AnswerMessage){
      var  options = m.options;
      MessageAction? ma = options[answer];
      if(ma != null){
        m.pick = answer;
        state.newEvent(ma.message);
        gameCycle();
      }
    }
    mainWidget.setState(() => {

    });
  }

  markRead(String chatName){
    int counter = 0;
    this.state.messages.where( 
      (message) => (message is! AnswerMessage) &&
                    message.chatId == chatName
    ).forEach((message) {
      if(!message.read){
        message.read= true;
        counter++;
      }
    });
    //if(counter > 0) mainWidget.setState(() => {});

  }
}