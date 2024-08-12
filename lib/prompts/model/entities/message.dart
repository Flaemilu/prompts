import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/chat.dart';
import 'package:prompts/prompts/model/entities/person.dart';

class Message {
  int id;
  Person person;
  int? chatId;
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