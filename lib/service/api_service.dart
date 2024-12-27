import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static Future<List<Task>> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tasks'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Task.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  static Future<void> addTask(
      String task, String description, DateTime? dueDate) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/tasks'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'task': task,
          'description': description,
          'dueDate': dueDate?.toIso8601String(),
        }),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to add task');
      }
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  static Future<void> updateTask(
      int id, String task, String description, DateTime? dueDate) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/tasks/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'task': task,
          'description': description,
          'dueDate': dueDate?.toIso8601String(),
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update task');
      }
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  static Future<void> deleteTask(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/tasks/$id'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  static updateTaskStatus(int id, String status) {}
}
