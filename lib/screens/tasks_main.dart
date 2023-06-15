import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/bottom_navigation.dart';
import 'package:todolist/widgets/tasklist_builder.dart';

class TasksMain extends StatelessWidget {
  const TasksMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('ToDoList'),
            backgroundColor: Colors.green.shade300,
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).go('/profile');
                  },
                  icon: const Icon(Icons.person))
            ]),
        body: TaskListBuilder(key: key),
        bottomNavigationBar: const BottomNavigation(),
      );
    });
  }
}
