import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ListView'),
        backgroundColor: Colors.white,
        // scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: item.monthItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(item.monthItems[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyDetails(item.monthItems[index]),
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
            thickness: 1,
            height: 20,
            indent: 16,
          );
        },
      ),
    );
  }
}

class MyDetails extends StatelessWidget {
  final String month;
  const MyDetails(this.month, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(month),
      ),
      body: Center(
        child: Text('This is the details page for $month'),
      ),
    );
  }
}
