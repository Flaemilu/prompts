import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/answer.dart';
import 'package:prompts/prompts/model/entities/chat.dart';
import 'package:prompts/prompts/model/entities/person.dart';
import 'package:prompts/prompts/model/game/action.dart';

class Message {
  int id;
  Person person;
  String chatId;
  String content;
  bool read;
  String messageLabel;
  Message(this.person, this.chatId, this.content, {String label = ""})
    :read=false,
     messageLabel = label,
     id=IdGenerator.nextId();

  @override
  bool operator ==(Object other) =>
      other is Message &&
      other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class AnswerMessage extends Message{
  Map<String, List<GameAction>> options;
  String? pick = null;
  AnswerMessage(this.options, super.person, super.chatId, super.content, {String label = ""}){
    super.messageLabel = label;
  }
}