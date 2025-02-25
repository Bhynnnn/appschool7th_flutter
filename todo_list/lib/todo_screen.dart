import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/add_todo_screen.dart';
import 'package:todo_list/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todoItems = [];
  bool showCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadTodoItems();
  }

  void _loadTodoItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> savedTodos = prefs.getStringList('todos') ?? [];
    setState(() {
      todoItems =
          savedTodos.map((item) => Todo.fromJson(jsonDecode(item))).toList();
      _sortTodos();
    });
  }

  Future<void> _saveTodos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> encodedTodos =
        todoItems.map((todo) => jsonEncode(todo.toJson())).toList();
    await prefs.setStringList('todos', encodedTodos);
  }

  Future<void> _addTodo(Todo newTodo) async {
    setState(() {
      todoItems.add(newTodo);
      _sortTodos();
    });
    await _saveTodos();
  }

  void _showEditBottomSheet(int index) {
    final TextEditingController titleController =
        TextEditingController(text: todoItems[index].title);
    final TextEditingController descriptionController =
        TextEditingController(text: todoItems[index].description);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 키보드
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text(
                    '할 일',
                    style: TextStyle(color: Colors.black87),
                  ),
                  hintText: '제목을 입력하세요',
                  helperText: '예: 운동하기, 공부하기',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amberAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amberAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amberAccent),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  label: Text(
                    '메모',
                    style: TextStyle(color: Colors.black87),
                  ),
                  hintText: '내용을 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amberAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amberAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.amberAccent),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todoItems[index] = Todo(
                          id: todoItems[index].id,
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: todoItems[index].isCompleted,
                        );
                        _sortTodos();
                        _saveTodos();
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('저장'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _toggleTodoCompletion(int index) {
    setState(() {
      todoItems[index].isCompleted = !todoItems[index].isCompleted;
      _sortTodos();
    });
    _saveTodos();
  }

  void _sortTodos() {
    setState(() {
      todoItems.sort((a, b) {
        if (a.isCompleted != b.isCompleted) {
          return a.isCompleted ? 1 : -1; // 미완료 먼저
        }
        return a.title.compareTo(b.title); // 제목 가나다순 정렬
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 단지 text표시만을 위해..
    List<Todo> activeTodos =
        todoItems.where((todo) => !todo.isCompleted).toList();
    List<Todo> completedTodos =
        todoItems.where((todo) => todo.isCompleted).toList();

    List<Todo> filteredTodos = showCompleted
        ? todoItems.where((todo) => !todo.isCompleted).toList()
        : todoItems;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Colors.amber.shade100,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber.shade100,
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  '남은 할 일: ${activeTodos.length}  /  완료된 할 일: ${completedTodos.length}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      showCompleted = !showCompleted;
                    });
                  },
                  icon: Icon(
                      showCompleted ? Icons.visibility_off : Icons.visibility),
                )
              ],
            ),
          ),
          filteredTodos.isEmpty
              ? Expanded(
                  child: Center(
                    child: Text(
                      'Todo 항목을 추가해주세요!',
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final todo = filteredTodos[index];
                      return Dismissible(
                        key: Key(todo.id),
                        background: Container(
                          color: Colors.amber.shade100,
                          alignment: Alignment.centerRight,
                          // padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.edit, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            todoItems.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${todo.title} 삭제 완료!')),
                          );
                        },
                        child: ListTile(
                          leading: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.amber.shade100,
                            value: todo.isCompleted,
                            onChanged: (value) {
                              print(value);
                              _toggleTodoCompletion(index);
                            },
                          ),
                          title: Text(
                            '📍 ${todo.title}',
                            style: TextStyle(
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          subtitle: Text(' ${todo.description}'),
                          onLongPress: () {
                            _showEditBottomSheet(index);
                          },
                        ),
                      );
                    },
                    itemCount: filteredTodos.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                        indent: 10,
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("floatingbutton pressed");
          final newTodo = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTodoScreen()));
          print('new todo in main $newTodo');
          if (newTodo != null) {
            _addTodo(newTodo);
          }
        },
        backgroundColor: Colors.amber.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 3,
        foregroundColor: Colors.black54,
        child: Text(
          '+',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
