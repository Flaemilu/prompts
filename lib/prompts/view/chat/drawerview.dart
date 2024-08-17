import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/gamemenucontroller.dart';
import 'package:prompts/prompts/model/entities/chat.dart';

class DrawerViewState extends State<DrawerView>{
  @override
  Widget build(BuildContext context) {
    var controller = widget.drawerController;
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
          title: Text('${chat.chatName} (${chat.unread})' , style:(chat.unread>0?const TextStyle(fontWeight: FontWeight.bold): const TextStyle(fontWeight: FontWeight.normal))),
          onTap: () {
            debugPrint("Switching to : ${chat.chatName}");
            controller.changeChat(chat.chatName);
          },
  );
}

class DrawerView extends StatefulWidget{

  final GameMenuController drawerController;
  const DrawerView(this.drawerController, {super.key});

  @override
  State<StatefulWidget> createState() {
    return DrawerViewState();
  }

}