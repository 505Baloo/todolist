import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get listOfTasks => _tasks;

  void setTasks(List<Task> tasks) {
    _tasks = tasks;
  }

  void add(Task taskToAdd) {
    if (!_tasks.contains(taskToAdd)) {
      _tasks.add(taskToAdd);
      notifyListeners();
    }
  }

  void remove(Task taskToRemove) {
    _tasks.removeWhere((task) => task.id == taskToRemove.id);
    notifyListeners();
  }

  Task getById(String id) {
    return _tasks.firstWhere((task) => task.id == id);
  }
}
