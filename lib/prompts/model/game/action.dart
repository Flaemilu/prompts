import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/game/game.dart';

sealed class GameAction{}

final class MessageAction extends GameAction{
  Message message;
  MessageAction(this.message);
}

final class AnswerAction extends GameAction{
  Map<String, List<GameAction>> answerMap;
  String label;
  String chatId;
  String? chosen;
  AnswerAction(this.answerMap, this.chatId, this.label);
}

final class CodeAction extends GameAction {
  void Function(Game) program;
  CodeAction(this.program);
}
