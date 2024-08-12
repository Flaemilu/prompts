import 'package:prompts/prompts/controller/events/event.dart';
import 'package:prompts/prompts/controller/events/eventhandler.dart';
import 'package:prompts/prompts/controller/events/eventmanager.dart';
import 'package:prompts/prompts/model/entities/chat.dart';
import 'package:prompts/prompts/model/gamestate.dart';
import 'package:prompts/prompts/lib/pair.dart';

class GameMenuController{

  GameState game;
  GameMenuController(this.game);
  
  List<Chat> getChats(){
    return game.getChatList();
  }

  int getProductivity(){
    return 1;
  }

  void changeChat(int chatId){
    EventManager.instance.fireEvent(
      UserChangeChat(chatId)
    );

  }
}