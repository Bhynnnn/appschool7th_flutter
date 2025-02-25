void main() {
  var name = 'John Doe';
  String explictName = 'John';
  int age = 30;
  double height = 1.80;
  bool isMarried = false;
  print(name);
  print(explictName);
  print(age);
  print(height);
  print(isMarried);

  List<String> fruits = ['apple', 'banana', 'orange'];
  print(fruits);

  Map<String, int> scores = {
    'math': 90,
    'english': 80,
    'science': 70,
  };
  print(scores);

  Set<int> numbers = {2, 3, 4, 1, 5};

  print(numbers);
  numbers.add(5);
  print(numbers);

  String? nullableName;
  String nonNullableName = 'John';

  print(nullableName?.length);
  print(nonNullableName.length);

  print('My name is $name, and I am $age years old');
  print('My name is ${name.toUpperCase()}, and I am ${age + 5} years old');
  print('Fruits: ${fruits.join(', ')}');
  print('scores: ${scores['math']}');
  print('Unique numbers: $numbers');
  print('Nullable name: ${nullableName ?? '이름없음'}');
}
