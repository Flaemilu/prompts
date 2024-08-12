import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';

sealed class UserEvent{

}

final class UserChangeChat extends UserEvent{
  int chatId;
  UserChangeChat(this.chatId);
}

final class UserPickAnswer extends UserEvent{
  int id;
  UserPickAnswer(this.id);
}

final class UserNextMessage extends UserEvent{}
