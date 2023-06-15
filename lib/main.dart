import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/screens/tasks_main.dart';
import 'package:todolist/screens/task_details.dart';
import 'package:todolist/providers/task_provider.dart';
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
            return TaskDetails(id: int.parse(state.pathParameters['id']!));
          },
        )
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
