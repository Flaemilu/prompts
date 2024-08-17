import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/chatcontroller.dart';
import 'package:prompts/prompts/view/chat/widgets/ChatBubble.dart';

class ChatListState extends State<ChatList>{

  final ScrollController _controller = ScrollController();

// This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {

    var chatList = Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 100),
          child:ListView(
            controller: widget.controller.scrollController,
            children: 
                          widget.controller
                            .getChats()
                            .map((e) => (ChatBubble(text:e.b, isCurrentUser:e.a == widget.controller.getChatName()) as Widget))
                            .toList()
          )
          
            
    );
    return chatList;
  }
  @override
  void initState() {
    super.initState();
    scrollDown();
  }
  
  @override
  void setState(void Function() asdf){
    super.setState(asdf);
    scrollDown();
  }
  

  void scrollDown() {
    debugPrint("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("scrolldown");
      widget.controller.scrollController.animateTo(widget.controller.scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 100), curve: Curves.linear);
    });
  }

  @override
  void didUpdateWidget(covariant ChatList oldWidget) {
    super.didUpdateWidget(oldWidget);
    scrollDown();
  }
}

class ChatList extends StatefulWidget{
  final ChatController controller;

  const ChatList(this.controller, {super.key});


  @override
  State<ChatList> createState() {
    return ChatListState();
  }
  
}