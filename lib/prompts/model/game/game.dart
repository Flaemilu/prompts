import 'package:flutter/material.dart';
import 'package:prompts/main.dart';
import 'package:prompts/prompts/controller/events/eventmanager.dart';
import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/action.dart';
import 'package:prompts/prompts/model/game/rule.dart';
import 'package:prompts/prompts/model/gamestate.dart';

class Game{
  Set<String> estados = {"START_GAME"};
  Set<WhenRule> reglas = {};
  GameState state = GameState();
  State mainWidget;
  String person = "dev";
  static Person bot = Person(IdGenerator.nextId(),"bot");
  static Person dev = Person(IdGenerator.nextId(), "dev");
  static Person luci = Person(IdGenerator.nextId(), "luci");
  
  
  Game(this.mainWidget){
    reglas.addAll([
      WhenRule(
        (state)=>!state.persons.contains(dev),
        [
          MessageAction(Message(dev, dev.personName, "Hola bot, soy tu dev, entendes lo que digo?")),
          MessageAction(Message(luci, luci.personName, "hola hola")),
          MessageAction(Message(luci, luci.personName, "hola hola")),
          MessageAction(Message(luci, luci.personName, "hola hola")),
          MessageAction(Message(luci, luci.personName, "hola hola")),
          MessageAction(Message(luci, luci.personName, "hola hola")),
          AnswerAction({
            "si":MessageAction(Message(bot, dev.personName, "si", label:"BOT_ENTIENDE")),
            "no":MessageAction(Message(bot, dev.personName, "no", label:"BOT_NO_ENTIENDE"))
          },
          "BOT_ENTIENDE_DEV"
        )
        ]
      ),
      WhenRule(
        (state) {
           return state.persons.contains(dev) && !state.messages.any((m) => m.messageLabel == "BOT_ENTIENDE");
        },
        [
          MessageAction(Message(dev, dev.personName, "Hola bot, soy tu dev, entendes lo que digo?")),
          AnswerAction(
            {
              "si":MessageAction(Message(bot, dev.personName, "si", label:"BOT_ENTIENDE")),
              "no":MessageAction(Message(bot, dev.personName, "no", label:"BOT_NO_ENTIENDE"))
            }, 
            "BOT_ENTIENDE_DEV"
          )
        ]
      )
    ]);
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
                label: String label
              ):
                state.newEvent(
                  AnswerMessage(answerMap, bot, dev.personName, "", label:label)
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
      AnswerMessage a = m as AnswerMessage;
      var  options = a.options;
      MessageAction? ma = options[answer];
      if(ma != null){
        a.pick = answer;
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
      (message) => !(message is AnswerMessage) &&
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