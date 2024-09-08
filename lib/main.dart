import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/gamemenucontroller.dart';
import 'package:prompts/prompts/model/game/game.dart';
import 'package:prompts/prompts/view/chat/bodyview.dart';
import 'package:prompts/prompts/view/chat/drawerview.dart';
import 'package:badges/badges.dart' as badges;



void main() {
  const app = const PromptsApp();
  runApp(app);
}



class PromptsApp extends StatelessWidget {
  const PromptsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prompts AI Interface',
      theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime.shade300),
        useMaterial3: true,
      ),
      home: const Prompts(title: 'Prompts AI Interface'),
    );
  }
}

class Prompts extends StatefulWidget {
  const Prompts({super.key, required this.title});

  final String title;

  @override
  State<Prompts> createState() => _PromptsState();
}

class _PromptsState extends State<Prompts> {
  Game? game;
  _PromptsState() {
    game = Game(this);
    game?.gameCycle();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var unread = GameMenuController(game!).getUnread(game!.person);
    if(unread > 0) {
      return Scaffold( 
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title:  Text(widget.title),
          leading: badges.Badge(
            position: badges.BadgePosition.center(),
            badgeContent: Text(
             unread.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child:IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {_scaffoldKey.currentState?.openDrawer();},
            )
          )
        ),
        drawer: DrawerView(GameMenuController(game!)),
        body: BodyView(game!) // This trailing comma makes auto-formatting nicer for build methods.
      );
    } else {
      return Scaffold( 
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title:  Text(widget.title),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {_scaffoldKey.currentState?.openDrawer();},
          )
        ),
        drawer: DrawerView(GameMenuController(game!)),
        body: BodyView(game!) // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
}
