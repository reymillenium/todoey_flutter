// Packages:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens:
import 'package:todoey_flutter/screens/tasks_screen.dart';

// Models:
import 'package:todoey_flutter/models/task.dart';

// Components:

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksData extends ChangeNotifier {
  // Properties:
  List<Task> _tasks = [
    Task(taskText: 'Buy milk', isChecked: false),
    Task(taskText: 'Buy eggs', isChecked: false),
    Task(taskText: 'Buy bread', isChecked: true),
  ];

  // Getters:
  int get tasksCount {
    return _tasks.length;
  }

  List<Task> get tasks {
    return _tasks;
  }

  // Public Methods:
  void addTask(String taskText) {
    Task newTask = Task(taskText: taskText);
    _tasks.add(newTask);
    notifyListeners();
  }

  // Public Methods:
  void updateTask(int index, String taskText) {
    Task updatingTask = _tasks[index];
    updatingTask.taskText = taskText;
    notifyListeners();
  }

  void toggleChecked(int index) {
    _tasks[index].toggleChecked();
    notifyListeners();
  }

  void deleteTask(int index, BuildContext context) {
    // _tasks.removeAt(index);
    // notifyListeners();
    _showDialog(index, context);
  }

  void _removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  String tasksCountLabel() {
    int taskAmount = tasksCount;
    String pluralization = taskAmount == 1 ? '' : 's';
    return '$taskAmount task$pluralization';
  }

  void _showDialog(int index, BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Removal Alert"),
          content: new Text("Are you sure?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("OK"),
              onPressed: () {
                _removeTask(index);
                Navigator.of(context).pop();
              },
            ),
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
