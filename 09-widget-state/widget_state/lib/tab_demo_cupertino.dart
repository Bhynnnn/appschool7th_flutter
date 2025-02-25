import 'package:flutter/material.dart';

class TabDemoCupertino extends StatelessWidget {
  const TabDemoCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), child: Text('Tab #1')),
              Tab(icon: Icon(Icons.settings), child: Text('Tab #2')),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Tab #1')),
            Center(child: Text('Tab #2')),
          ],
        ),
      ),
    );
  }
}
