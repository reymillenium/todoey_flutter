// Packages:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens:
import 'package:todoey_flutter/screens/tasks_screen.dart';

// Models:
import 'package:todoey_flutter/models/tasks_data.dart';

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
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
