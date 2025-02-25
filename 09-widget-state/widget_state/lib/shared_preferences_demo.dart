import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  State<SharedPreferencesDemo> createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _controller.addListener(() => setState(() {}));
    _loadUsername();
  }

  void _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller.text = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared preferences Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter yuer username'),
            ),
            ElevatedButton(
              onPressed: () async {
                // shared_preferences 패키지를 사용하여 SharedPreferences 인스턴스를 가져옵니다.
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                // SharedPreferences에 사용자 이름을 저장합니다.
                prefs.setString('username', _controller.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
