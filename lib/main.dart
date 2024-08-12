import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/gamemenucontroller.dart';
import 'package:prompts/prompts/model/gamestate.dart';
import 'package:prompts/prompts/view/chat/bodyview.dart';
import 'package:prompts/prompts/view/chat/drawerview.dart';
import 'package:prompts/prompts/view/chat/widgets/Answer.dart';
import 'package:prompts/prompts/view/chat/widgets/ChatBubble.dart';
import 'package:prompts/prompts/widgets/chaticon.dart';
import 'package:prompts/prompts/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prompts AI Interface',
      theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime.shade300),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Prompts AI Interface'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    GameState game = GameState();
    return Scaffold( 
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      drawer: DrawerView(GameMenuController(game)),
      body: BodyView(game) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
