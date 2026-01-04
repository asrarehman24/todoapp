import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task.dart';
import 'api_demo_screen.dart';
import 'user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> taskMaps = tasks.map((t) => t.toMap()).toList();
    String encoded = json.encode(taskMaps);
    await prefs.setString('tasks', encoded);
  }

  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.remove('tasks');

    String? tasksString = prefs.getString('tasks');

    if (tasksString != null) {
      List<dynamic> decoded = json.decode(tasksString);
      setState(() {
        tasks = decoded
            .map((e) => Task.fromMap(e as Map<String, dynamic>))
            .toList();
      });
    }
  }

  // Add a new task
  void _addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
    _saveTasks();
  }

  // Delete a task
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    _saveTasks();
  }

  // Toggle task completion
  void _toggleDone(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
    _saveTasks();
  }

  // Show dialog to add a new task
  void _showAddTaskDialog() {
    String newTask = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Task'),
        content: TextField(
          autofocus: true,
          onChanged: (val) => newTask = val,
          decoration: const InputDecoration(hintText: 'Task title'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (newTask.trim().isNotEmpty) {
                _addTask(newTask.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'api_demo':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApiDemoScreen(),
                    ),
                  );
                  break;
                case 'user_profile':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfileScreen(),
                    ),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'api_demo',
                child: Text('API Demo'),
              ),
              const PopupMenuItem<String>(
                value: 'user_profile',
                child: Text('User Profile'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddTaskDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return ListTile(
            leading: Checkbox(
              value: task.isDone,
              onChanged: (_) => _toggleDone(index),
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTask(index),
            ),
          );
        },
      ),
    );
  }
}
