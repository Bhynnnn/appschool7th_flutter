import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('레이아웃 예제')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.grey[200],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.red,
                    child: Text('위젯 1'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.green,
                    child: Text('위젯 2'),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text('위젯 1'),
              ),
              Image.network('https://')
            ],
          ),
        ),
      ),
    );
  }
}
