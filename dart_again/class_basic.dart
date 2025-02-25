class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print('My name is $name. I am $age years old');
  }

  String get getName => name;

  set personAge(int value) {
    if (value >= 0) {
      age = value;
    }
  }
}

void main() {
  var person = Person('John Doe', 30);

  print('Name: ${person.name}, Age: ${person.age}');

  person.introduce();

  print('Getter: ${person.getName}');
  person.personAge = 10;
  print('Setter: $person.age');
}
