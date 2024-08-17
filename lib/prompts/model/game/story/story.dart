import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/action.dart';
import 'package:prompts/prompts/model/game/game.dart';
import 'package:prompts/prompts/model/game/rule.dart';
import 'package:prompts/prompts/model/gamestate.dart';

abstract class Story {
  
  final Game game;
  
  Story(this.game){}
  
  void loadStory();


  bool  containsPerson(Person p, GameState g){
    return g.persons.contains(p);
  }

  bool messageReceived(String label, GameState g){
    return g.messages.any((message) => message.messageLabel == label);
  }

  bool lastMessageReceived(String label, GameState g){
      try{
        return g.messages.where((message) => message is! AnswerMessage).last.messageLabel == label;
      } catch (e) {
        return false;
      }
  }

  bool Function() and(bool Function() f1, bool Function() f2){
    return () {
      var v1 = f1();
      var v2 = f2();
      return v1 && v2;
    };
  }


  bool Function() or(bool Function() f1, bool Function() f2){
    return () {
      var v1 = f1();
      var v2 = f2();
      return v1 || v2;
    };
  }

  bool Function() not(bool Function() f){
    return () {
      return !f();
    };
  }

  bool Function() imp(bool Function() p, bool Function() q){
    return or(not(p), q);
  }

  WhenRule dm(bool Function(GameState) condition, Person p, List<String> messages, {String? labelLast}){
    return WhenRule(
      condition,
      makeMessages(p, messages, p.personName, labelLast)
    );
  }
  

  void addRule(WhenRule g){
    game.reglas.add(g);
  }


  WhenRule prompt(bool Function(GameState) condition, List<MapEntry<String, MessageAction>> entries, String chatId, String label){
    return WhenRule(
      condition, 
      [AnswerAction(Map.fromEntries(entries), chatId, label)]
    );
  }

  MapEntry<String, MessageAction> option(String prompt, String chatId, String label){
    return MapEntry(prompt, MessageAction(Message(Game.bot, chatId, prompt, label: label)));
  }
  
  List<MessageAction> makeMessages(Person p, List<String> messages, String chat, String? labelLast){
    var retList = messages.map(
      (content) =>  MessageAction(Message(p, chat, content))
    ).toList();
    if(labelLast != null && retList.isNotEmpty) retList.last.message.messageLabel = labelLast;
    return retList;
  }

  bool Function(GameState) rule(bool Function() f){
    return (state) => f();
  }
}