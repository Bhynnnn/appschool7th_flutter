import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_state/drawer_demo.dart';
import 'package:widget_state/tab_demo.dart';
import 'package:widget_state/tab_demo_cupertino.dart';

import 'container_view.dart';
import 'my_list_view.dart';
import 'my_sliver_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Fonts Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   textTheme: TextTheme(
      //     bodyLarge:
      //         GoogleFonts.aBeeZee(fontSize: 30, color: Colors.deepOrange),
      //     bodyMedium:
      //         GoogleFonts.aBeeZee(fontSize: 18, color: Colors.grey[700]),
      //   ),
      // ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo"),
      ),
      body: Center(
        // Column을 중앙 정렬
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column 크기를 최소한으로 유지
          children: [
            ElevatedButton(
              onPressed: () {
                print("📍 ContainerView Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ContainerView(title: 'Flutter Demo Home Page'),
                  ),
                );
              },
              child: const Text('Container by PlatformCheck'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 MyListView Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyListView(),
                  ),
                );
              },
              child: const Text('ListView'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 SliverListView Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySliverListView(),
                  ),
                );
              },
              child: const Text('SliverListView'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 GridView Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySliverListView(),
                  ),
                );
              },
              child: const Text('GridView'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 DrawerDemo Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrawerDemo(),
                  ),
                );
              },
              child: const Text('DrawerDemo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 DrawerDemo Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrawerDemo(),
                  ),
                );
              },
              child: const Text('DrawerDemo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 TabDemo Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabDemo(),
                  ),
                );
              },
              child: const Text('TabDemo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("📍 TabDemoCupertino Button Pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabDemoCupertino(),
                  ),
                );
              },
              child: const Text('TabDemoCupertino'),
            ),
          ],
        ),
      ),
    );
  }
}
