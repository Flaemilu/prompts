

class Person{
  int personId;
  String personName;

  Person(this.personId, this.personName);

  @override
  bool operator ==(Object other) =>
      other is Person &&
      other.personId == personId;

  @override
  int get hashCode => personId.hashCode;
}