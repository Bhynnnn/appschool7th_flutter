// 파일을 사용하지 않고, 데이터를 가져와서 사용하는 방법
// 데이터를 가져오는 클래스를 만들고, 그 클래스를 사용하는 방법

import 'package:flutter/material.dart';

class MyData {
  final List<String> items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  MyData();
}

class Basic extends StatelessWidget {
  Basic({super.key});
  final MyData data = MyData();

  @override
  Widget build(BuildContext context) {
    const title = 'MyAwesomeApp';
    List items = data.items;

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          },
        ),
      ),
    );
  }
}
