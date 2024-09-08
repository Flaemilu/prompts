import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/chatcontroller.dart';
import 'package:prompts/prompts/view/chat/widgets/Answer.dart';
import 'package:prompts/prompts/view/chat/widgets/ChatBubble.dart';
import 'package:prompts/prompts/view/chat/widgets/chatlist.dart';

class ChatViewState extends State<ChatView>{

  
  ChatViewState();

  @override
  Widget build(BuildContext context) {
    var controller = this.widget.controller;
    var unread = this.widget.controller.getUnread();
    controller.markRead();
    return 
      Stack(
            children: [
                Align(
                  alignment: Alignment.topRight,
                  child:ChatList(controller, unread)
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