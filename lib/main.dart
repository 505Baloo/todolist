import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/screens/task_form.dart';
import 'package:todolist/screens/tasks_main.dart';
import 'package:todolist/screens/task_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TaskProvider>(
        create: (context) => TaskProvider(), child: const MainApp()),
  );
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      name: 'main',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TasksMain();
      },
      routes: [
        GoRoute(
          name: 'details',
          path: 'details/:id',
          builder: (BuildContext context, GoRouterState state) {
            try {
              final String taskId = state.pathParameters['id']!;
              final Task task =
                  Provider.of<TaskProvider>(context, listen: false)
                      .getById(taskId);
              return TaskDetails(task: task);
            } catch (e) {
              return const TasksMain();
            }
          },
        ),
        GoRoute(
            name: 'form',
            path: 'taskform',
            builder: (BuildContext context, GoRouterState state) {
              return const TaskForm();
            })
      ])
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'AnotherToDoList',
    );
  }
}
