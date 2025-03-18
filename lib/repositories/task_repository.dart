import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/task_model.dart';

class TaskRepository {
  static const String baseUrl = 'https://hushed-foggy-dollar.glitch.me/api';

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/glitch-tasks'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<Task> addOrUpdateTask(Task task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add-task'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );
    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body)['task']);
    } else {
      throw Exception('Failed to add/update task');
    }
  }
}
