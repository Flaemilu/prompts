import 'package:prompts/prompts/model/prompt.dart';

class Person{
  int personId;
  Person(this.personId);
  List<Person> getChats(){return [];}
  List<Prompt> getChat(Person p){return [];}
}