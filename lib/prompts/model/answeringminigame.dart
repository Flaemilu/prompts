import 'package:prompts/prompts/lib/pair.dart';
import 'package:prompts/prompts/model/entities/person.dart';

class AnsweringMiniGame{

  List<String> respuestasValidas;
  List<String> ruido;
  Person interlocutor; 
  String respuestaActual = "";

  AnsweringMiniGame(this.respuestasValidas, this.interlocutor, this.ruido);
  
  List<Pair<String, double>> getOptions(){
    return this.respuestasValidas.map((res) => Pair(res, 0.0)).toList();
  }

  void pickOption(int option){

  }

  Pair<int, String> answer(){
    return Pair(0,"hola");
  }

}