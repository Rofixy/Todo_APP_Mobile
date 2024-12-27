// task_provider.dart
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  void fetchTasks() {
    // For now, let's add some dummy tasks if the list is empty
    if (_tasks.isEmpty) {
      _tasks = [];
    }
    notifyListeners();
  }

  void addTask({
    required String task,
    required String description,
    DateTime? dueDate,
  }) {
    final newTask = {
      'id': _tasks.isEmpty ? 1 : _tasks.last['id'] + 1,
      'task': task,
      'description': description,
      'dueDate': dueDate?.toString(),
    };
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask({
    required int id,
    required String task,
    required String description,
    DateTime? dueDate,
  }) {
    final index = _tasks.indexWhere((task) => task['id'] == id);
    if (index != -1) {
      _tasks[index] = {
        'id': id,
        'task': task,
        'description': description,
        'dueDate': dueDate?.toString(),
      };
      notifyListeners();
    }
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task['id'] == id);
    notifyListeners();
  }
}
