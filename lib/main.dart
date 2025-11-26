import 'package:flutter/material.dart';
import 'screens/counter_screen.dart';
import 'screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 2 - Data Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterScreen(), // Start with Counter app
      routes: {'/todo': (context) => const TodoScreen()},
    );
  }
}
