import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final List<String> items = List.generate(20, (index) => 'Item $index + 1');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView 예제')),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
