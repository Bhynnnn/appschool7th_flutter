import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  bool isCompleted;

  Todo({
    String? id,
    this.description,
    required this.title,
    required this.isCompleted,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description ?? '',
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'] ?? '제목없음',
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
