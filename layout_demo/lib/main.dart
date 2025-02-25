import 'package:flutter/material.dart';
import 'package:layout_demo/grid_horizontal_screen.dart';
import 'package:layout_demo/grid_screen.dart';
import 'package:layout_demo/list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('반응형 UI 예제')),
      body: Column(
        children: [
          LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              double fontSize = constraints.maxWidth > 600 ? 32 : 24;
              return Center(
                child: Text(
                  '반응형 텍스트',
                  style: TextStyle(fontSize: fontSize),
                ),
              );
            },
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.red,
                  child: const Text('위젯 1'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.green,
                  child: const Text('위젯 2'),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListScreen(),
                  ),
                );
              },
              child: const Text('Go ListScreen'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GridScreen(),
                  ),
                );
              },
              child: const Text('Go GridScreen'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GridHorizontalScreen(),
                  ),
                );
              },
              child: const Text('Go GridHorizontalScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
