import 'dart:convert';

class TaskViewModel {
  String title;
  bool done;

  TaskViewModel({
    required this.title,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'done': done,
    };
  }

  factory TaskViewModel.fromMap(Map<String, dynamic> map) {
    return TaskViewModel(
      title: map['title'] as String,
      done: map['done'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskViewModel.fromJson(String source) =>
      TaskViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TaskViewModel(title: $title, done: $done)';
}
