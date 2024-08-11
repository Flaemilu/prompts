import 'package:flutter/material.dart';

class ChatIconState extends State<ChatIcon>{
  

  Widget build(BuildContext context) {
    return new Padding(padding: const EdgeInsets.all(8.0), 
            child:FloatingActionButton(
              onPressed: () => {},
              tooltip: widget.name,
              child: Text(widget.name),
            )
          );
  }
}

class ChatIcon extends StatefulWidget{

  int notifications = 0;

  String name = "";

  ChatIcon(this.name, this.notifications);

  State<ChatIcon> createState() => ChatIconState();

}