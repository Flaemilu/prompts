import 'dart:ffi';

import 'package:prompts/prompts/model/pair.dart';
import 'package:prompts/prompts/model/person.dart';

class AnsweringMiniGame{

  List<String> respuestasValidas;
  List<String> ruido;
  Person interlocutor; 
  String respuestaActual = "";

  AnsweringMiniGame(this.respuestasValidas, this.interlocutor, this.ruido);
  
  List<Pair<String, Float>> getOptions(){
    return [];
  }

  void pickOption(int option){

  }

  Pair<int, String> answer(){
    return Pair(0,"hola");
  }

}