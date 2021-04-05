// Packages:
import 'package:flutter/material.dart';

// Screens:
import 'package:todoey_flutter/screens/tasks_screen.dart';

// Components:

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
