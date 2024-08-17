import 'package:prompts/prompts/model/entities/message.dart';

sealed class GameAction{}

final class MessageAction extends GameAction{
  Message message;
  MessageAction(this.message);
}

final class AnswerAction extends GameAction{
  Map<String, MessageAction> answerMap;
  String label;
  String chatId;
  String? chosen;
  AnswerAction(this.answerMap, this.chatId, this.label);
}
