int add(int a, int b) {
  return a + b;
}

void greet(String name, [String? title]) {
  if (title != null) {
    print("hello, $title $name");
  } else {
    print('Hello, $name');
  }
}

void printPerson({
  required String name,
  int age = 0,
  String? occupation,
}) {
  print('Name: $name, Age: $age');
  if (occupation != null) {
    print('Occupation: $occupation');
  }
}

void main() {
  print('합계 ${add(10, 20)}');
  greet('John Doe');
  greet('John Doe', 'Mr.');

  printPerson(name: 'John Doe', age: 30);
  printPerson(name: 'John Doe', age: 30, occupation: 'Software Engineer');
}
