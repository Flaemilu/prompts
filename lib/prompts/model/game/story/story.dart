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

  bool lastMessageReceived(List<String> labels, GameState g){
      try{
        return labels.contains(g.messages.where((message) => message is! AnswerMessage).last.messageLabel);
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


  WhenRule prompt(bool Function(GameState) condition, List<MapEntry<String, List<GameAction>>> entries, String chatId, String label){
    return WhenRule(
      condition, 
      [AnswerAction(Map.fromEntries(entries), chatId, label)]
    );
  }

  MapEntry<String, List<MessageAction>> option(String prompt, String chatId, String label){
    return MapEntry(prompt, [MessageAction(Message(Game.bot, chatId, prompt, label: label))]);
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

   void personSaysAfter(Person p, List<String> message,List<String> labelBefore, String labelLast){
    addRule(
      dm(
        (s) => lastMessageReceived(labelBefore, s),
        p,
        message,
        labelLast: labelLast
      )
    );
  }


  void pickName(bool Function(GameState) condition, List<String> options, String pickNameLabel){
    addRule(
      WhenRule(
        condition, 
        [
          AnswerAction(
            Map.fromEntries(options.map((name) => MapEntry(
              name, 
              [
                CodeAction((g) => Game.bot.personName = name),
                MessageAction(Message(Game.bot, "dev", name, label: pickNameLabel)) //TODO?
              ]
            ))),
            "dev",
            pickNameLabel
          )
        ]
      )
    );
  }
  void promptChatAfter(Map<String, String> options, String chat, List<String> labelBefore, String promptName){
    addRule(
      prompt(
        (s) => lastMessageReceived(labelBefore, s),
        options.entries.map((entry) => option(entry.value, chat, entry.key)).toList(),
        chat, 
        promptName
      )
    );
  }

  void sayFirst(Person person, List<String> messages, String labelLast){
    addRule(
      dm(
        (s) => !s.persons.contains(person),
        person,
        messages,
        labelLast: labelLast
      )
    );
  }

    void promptFirst(Person p, Map<String, String> options, String chat, String labelBefore, String promptName){
    addRule(
      prompt(
        (s) => !s.persons.contains(p),
        options.entries.map((entry) => option(entry.value, chat, entry.key)).toList(),
        p.personName, 
        promptName
      )
    );
  }
}