import 'package:flutter/material.dart';

class GridHorizontalScreen extends StatelessWidget {
 GridHorizontalScreen({super.key});

  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('가로 스크롤 GridView 예제')),
        body: Scrollbar(
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Container(
                color: Colors.blue[100 * ((index % 9) + 1)],
                child: Center(child: Text(item)),
              );
            },
          ),
        ),
      ),
    );
  }
}
