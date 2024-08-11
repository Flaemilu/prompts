import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/pair.dart';
import 'package:prompts/prompts/model/entities/person.dart';

class Chat{
  String chatName;
  int chatId;
  int unread = 0;
  Chat(this.chatName)
    :chatId = IdGenerator.nextId();
  
  

  @override
  bool operator ==(Object other) =>
      other is Chat &&
      other.chatId == chatId;

  @override
  int get hashCode => chatId.hashCode;
}