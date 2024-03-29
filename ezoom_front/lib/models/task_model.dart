import 'dart:convert';

class TaskModel {
  int id;
  String title;
  int done;
  String createdAt;
  String updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.done,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'done': done,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int,
      title: map['title'] as String,
      done: map['done'] as int,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, done: $done, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
