import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  // Get completed tasks
  List<Task> get completedTasks => _tasks.where((task) => task.isDone).toList();

  // Get pending tasks
  List<Task> get pendingTasks => _tasks.where((task) => !task.isDone).toList();

  // Get total task count
  int get totalTasks => _tasks.length;

  // Get completed task count
  int get completedTaskCount => completedTasks.length;

  TaskProvider() {
    _loadTasks();
  }

  // Load tasks from SharedPreferences
  Future<void> _loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tasksString = prefs.getString('tasks');

      if (tasksString != null) {
        List<dynamic> decoded = json.decode(tasksString);
        _tasks = decoded
            .map((e) => Task.fromMap(e as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('Error loading tasks: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Save tasks to SharedPreferences
  Future<void> _saveTasks() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, dynamic>> taskMaps = _tasks
          .map((t) => t.toMap())
          .toList();
      String encoded = json.encode(taskMaps);
      await prefs.setString('tasks', encoded);
    } catch (e) {
      debugPrint('Error saving tasks: $e');
    }
  }

  // Add a new task
  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;

    final newTask = Task(title: title.trim());
    _tasks.add(newTask);
    notifyListeners();
    await _saveTasks();
  }

  // Delete a task
  Future<void> deleteTask(int index) async {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
      await _saveTasks();
    }
  }

  // Toggle task completion
  Future<void> toggleTask(int index) async {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].isDone = !_tasks[index].isDone;
      notifyListeners();
      await _saveTasks();
    }
  }

  // Update task title
  Future<void> updateTask(int index, String newTitle) async {
    if (index >= 0 && index < _tasks.length && newTitle.trim().isNotEmpty) {
      _tasks[index].title = newTitle.trim();
      notifyListeners();
      await _saveTasks();
    }
  }

  // Clear all completed tasks
  Future<void> clearCompletedTasks() async {
    _tasks.removeWhere((task) => task.isDone);
    notifyListeners();
    await _saveTasks();
  }

  // Clear all tasks
  Future<void> clearAllTasks() async {
    _tasks.clear();
    notifyListeners();
    await _saveTasks();
  }

  // Get task by index
  Task? getTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      return _tasks[index];
    }
    return null;
  }

  // Check if task exists
  bool taskExists(String title) {
    return _tasks.any(
      (task) => task.title.toLowerCase() == title.toLowerCase(),
    );
  }
}
