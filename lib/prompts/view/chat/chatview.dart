import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/chatcontroller.dart';
import 'package:prompts/prompts/model/answeringminigame.dart';
import 'package:prompts/prompts/view/chat/widgets/Answer.dart';
import 'package:prompts/prompts/view/chat/widgets/ChatBubble.dart';

class ChatViewState extends State<ChatView>{

  
  ChatViewState();

  @override
  Widget build(BuildContext context) {
    var controller = this.widget.controller;
    controller.markRead();
    return 
      Stack(
            children: [
                Align(
                  alignment: Alignment.topRight,

                  child: SingleChildScrollView(
                
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 50),
                    child: Column(
                    children: 
                          controller
                            .getChats()
                            .map((e) => (ChatBubble(text:e.b, isCurrentUser:e.a == controller.getChatName()) as Widget))
                            .toList()
                    ))
                  )
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 2,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50,50,0,25),
                    child:AnswerWidget(controller)
                  )
                )
            ]            
        );
    
  }

}
class ChatView extends StatefulWidget{

  final ChatController controller;

  const ChatView(this.controller);

  @override
  State<ChatView> createState() => ChatViewState();

}