import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/gamemenucontroller.dart';
import 'package:prompts/prompts/model/game/game.dart';
import 'package:prompts/prompts/model/gamestate.dart';
import 'package:prompts/prompts/view/chat/bodyview.dart';
import 'package:prompts/prompts/view/chat/drawerview.dart';
import 'package:prompts/prompts/view/chat/widgets/Answer.dart';
import 'package:prompts/prompts/view/chat/widgets/ChatBubble.dart';
import 'package:prompts/prompts/widgets/chaticon.dart';
import 'package:prompts/prompts/widgets/drawer.dart';



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


  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: DrawerView(GameMenuController(game!)),
      body: BodyView(game!) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
