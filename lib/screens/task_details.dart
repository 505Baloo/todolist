import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Hello world!'),
    );
  }
}
