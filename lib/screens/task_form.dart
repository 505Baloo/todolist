import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/bottom_navigation.dart';
import 'package:uuid/uuid.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  TaskFormState createState() => TaskFormState();
}

class TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final contentController = TextEditingController();
  final categoryController = TextEditingController();
  final priorityController = TextEditingController();
  final uuid = const Uuid();

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  Task? handleValidation() {
    Task? testTask;
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing your form')),
      );
      testTask = Task(
          content: contentController.text,
          createdAt: DateTime.now(),
          category: categoryController.text,
          priority: int.parse(priorityController.text),
          id: uuid.v4());
    }
    return testTask;
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 75,
                  child: TextFormField(
                    controller: contentController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Task' 's content'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 75,
                  child: TextFormField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Task' 's category'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 75,
                  child: TextFormField(
                    controller: priorityController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Task' 's priority'),
                    validator: (value) {
                      var checkIfInteger = int.tryParse(value!);
                      if (checkIfInteger == null || value.length > 1) {
                        return 'This field must be an integer';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Task? task = handleValidation();
                    taskProvider.add(task!);
                    GoRouter.of(context).go('/');
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          )),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
