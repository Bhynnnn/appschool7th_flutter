import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyListView(),
    );
  }
}

class ListDataItems {
  final List<String> monthItems = [
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
    'December'
  ];
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ListDataItems item = ListDataItems();

    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: ListView.builder(
          itemCount: item.monthItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                item.monthItems[index],
              ),
            );
          },
        ));
  }
}
