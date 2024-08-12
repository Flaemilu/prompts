import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/chatcontroller.dart';
import 'package:prompts/prompts/model/gamestate.dart';
import 'package:prompts/prompts/view/chat/chatview.dart';

class BodyViewState extends State<BodyView>{

  @override
  Widget build(BuildContext context) {
    return ChatView(this.widget.chatController);
      
  }

}

class BodyView extends StatefulWidget {

  ChatController chatController;
  GameState game;
  BodyView(this.game)
    :chatController = ChatController(game);
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyViewState();
  }
  
}