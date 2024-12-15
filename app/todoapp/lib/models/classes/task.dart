import 'package:flutter/material.dart';
import 'package:todoapp/models/widgets/intray_todo_widget.dart';

class Task extends StatelessWidget{
  //List<Task> tasks;
  String title;
  String notes;
  DateTime completionTime = DateTime(1900, 01, 01);
  DateTime timeToComplete = DateTime(1900, 01, 01);
  bool completed;
  String repeats = '';
  DateTime deadline = DateTime(1900, 01, 01);
  List<DateTime> reminders = List.empty();
  final Key key;

  Task(this.title, this.notes, this.completed, this.key) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IntrayTodo(title, notes, key);
  }
  

    Task.fromJson(Map<String, Object?> json) : this(
      json['title']! as String,
      json['notes']! as String,
      json['completed']! as bool,
      json['key'] as Key
    );


    Map<String, Object> toJson() {
      return {
        'title': title,
        'notes': notes,
        'key': key.toString()
      };
    }
}