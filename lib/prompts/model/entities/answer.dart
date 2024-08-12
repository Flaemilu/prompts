sealed class Answer {
  int chatId;
  Answer(this.chatId);
}

final class AnswerNextMessage extends Answer{
  AnswerNextMessage(super.chatId);
}

final class AnswerOptions extends Answer{
  List<String> options;
  AnswerOptions(super.chatId, this.options);
}

