import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  // final int id;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Hello world!'),
    );
  }
}
