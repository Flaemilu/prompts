import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/entities/answer.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/lib/pair.dart';
import 'package:prompts/prompts/model/entities/person.dart';

class Chat{

  String chatName;
  int unread = 0;

  Chat(this.chatName);
  
  

  @override
  bool operator ==(Object other) =>
      other is Chat &&
      other.chatName == chatName;

  @override
  int get hashCode => chatName.hashCode;
}