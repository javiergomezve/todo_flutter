import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/app/model/task.dart';

class TaskRepository {
  Future<bool> addTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonTasks = prefs.getStringList('tasks') ?? [];
    jsonTasks.add(jsonEncode(task.toJson()));

    return prefs.setStringList('tasks', jsonTasks);
  }

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = prefs.getStringList('tasks') ?? [];
    return jsonTasks.map((task) => Task.fromJson(jsonDecode(task))).toList();
  }

  Future<bool> saveTask(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = tasks.map((task) => jsonEncode(task.toJson())).toList();
    return prefs.setStringList('tasks', jsonTasks);
  }
}
