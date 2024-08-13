import 'package:prompts/prompts/model/game/action.dart';
import 'package:prompts/prompts/model/gamestate.dart';

sealed class GameRule{
  bool Function(GameState) canRun;
  GameRule(this.canRun);
}

final class WhenRule extends GameRule{
  List<GameAction> nextActions;
  WhenRule(super.canRun, this.nextActions);
}