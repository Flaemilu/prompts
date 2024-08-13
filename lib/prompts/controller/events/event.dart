import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';

sealed class UserEvent{

}

final class UserChangeChat extends UserEvent{
  String chatId;
  UserChangeChat(this.chatId);
}

final class UserPickAnswer extends UserEvent{
  String id;
  String label;
  UserPickAnswer(this.id, this.label);
}

final class UserNextMessage extends UserEvent{}
