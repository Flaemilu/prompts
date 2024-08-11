sealed class UserEvent{

}

final class UserChangeChat extends UserEvent{
  String name;
  UserChangeChat(this.name);
}

final class UserPickAnswer extends UserEvent{
  int id;
  UserPickAnswer(this.id);
}

final class UserNextMessage extends UserEvent{}