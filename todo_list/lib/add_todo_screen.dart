import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('할 일 추가하기')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      controller: titleController,
                      cursorColor: Colors.amber[200],
                      decoration: InputDecoration(
                        label: Text(
                          '할 일',
                          style: TextStyle(color: Colors.black87),
                        ),
                        hintText: '제목을 입력하세요',
                        helperText: '예: 운동하기, 공부하기',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amberAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amberAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amberAccent),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      controller: descriptionController,
                      cursorColor: Colors.amber[200],
                      maxLines: null, // null로 설정하면 자동으로 줄바꿈됨
                      keyboardType: TextInputType.multiline, // 여러 줄 입력 가능하도록 설정
                      decoration: InputDecoration(
                        label: Text(
                          '메모',
                          style: TextStyle(color: Colors.black87),
                        ),
                        hintText: '내용을 입력하세요',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amberAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amberAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amberAccent),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) {
                    print("title is empty");
                    return;
                  } else {
                    print("추가 button tapped");
                    final Todo newTodo = Todo(
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: false,
                    );
                    Navigator.pop(context, newTodo);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade100,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('추가하기',
                    style: TextStyle(fontSize: 16, color: Colors.black87)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
