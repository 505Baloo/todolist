import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:go_router/go_router.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 6,
        child: ListTile(
          title: Text(
              '${task.content} - ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year} - Priority : ${task.priority}'),
          dense: true,
          contentPadding: const EdgeInsets.all(6),
          onTap: () {
            GoRouter.of(context).go('/details/${task.id}');
          },
        ));
  }
}
