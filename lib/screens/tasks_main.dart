import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TasksMain extends StatelessWidget {
  const TasksMain({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: IconButton(
        icon: const Icon(Icons.navigate_next),
        onPressed: () {
          GoRouter.of(context).go('/details/1');
        },
      ),
    );
  }
}
