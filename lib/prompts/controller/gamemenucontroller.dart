import 'package:prompts/prompts/controller/events/event.dart';
import 'package:prompts/prompts/controller/events/eventhandler.dart';
import 'package:prompts/prompts/model/game.dart';
import 'package:prompts/prompts/model/pair.dart';

class GameMenuController{

  Game game;
  GameMenuController(this.game);
  
  List<Pair<String, int>> getChatNames(){
    return [Pair("luci", 1), Pair("dev", 0), ];
  }

  int getProductivity(){
    return 1;
  }

}