import 'package:prompts/prompts/model/entities/IdGenerator.dart';
import 'package:prompts/prompts/model/prompt.dart';

class Person{
  int personId;
  String personName;

  Person(this.personName)
    :personId=IdGenerator.nextId();

  @override
  bool operator ==(Object other) =>
      other is Person &&
      other.personId == personId;

  @override
  int get hashCode => personId.hashCode;
}