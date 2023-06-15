import 'package:flutter/material.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widgets/task_preview.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.listOfTasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final id = taskProvider.listOfTasks[index].id;
        final task = taskProvider.getById(id!);
        return TaskPreview(task: task);
      },
    );
  }
}
