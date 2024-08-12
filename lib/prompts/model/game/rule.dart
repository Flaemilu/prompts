import 'package:prompts/prompts/model/game/action.dart';
import 'package:prompts/prompts/model/gamestate.dart';

sealed class GameRule{
}

final class WhenRule extends GameRule{
  bool Function(GameState) canRun;
  List<GameAction> nextActions;
  WhenRule(this.canRun, this.nextActions);
}