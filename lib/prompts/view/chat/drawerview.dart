import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/gamemenucontroller.dart';
import 'package:prompts/prompts/model/entities/chat.dart';

class DrawerViewState extends State<DrawerView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var controller = this.widget.drawerController;
    var prod = controller.getProductivity().toString();

    List<Widget> drawerItems = [];
    drawerItems.add(
      DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: Text('Productividad: $prod', style:const TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
        )
    );
    drawerItems.addAll(controller.getChats().map((chat) => _chatwidget(chat, controller)));
    
    return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: drawerItems,
    ),
  );
  }

}

Widget _chatwidget(Chat chat, GameMenuController controller){
  return ListTile(
          title: Text('${chat.chatName} (${chat.unread})' , style:(chat.unread>0?TextStyle(fontWeight: FontWeight.bold):TextStyle(fontWeight: FontWeight.normal))),
          onTap: () {
            debugPrint("Switching to : ${chat.chatName}");
            controller.changeChat(chat.chatName);
          },
  );
}

class DrawerView extends StatefulWidget{

  GameMenuController drawerController;
  DrawerView(this.drawerController);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerViewState();
  }

}