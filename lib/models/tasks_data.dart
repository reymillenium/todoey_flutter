// Packages:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  void updateTask(int index, String taskText) {
    Task updatingTask = _tasks[index];
    updatingTask.taskText = taskText;
    notifyListeners();
  }

  void toggleChecked(int index) {
    _tasks[index].toggleChecked();
    notifyListeners();
  }

  void deleteTaskWithConfirm(int index, BuildContext context) {
    // _showDialog(index, context);
    _createAlert(index: index, context: context).show();
  }

  String tasksCountLabel() {
    int taskAmount = tasksCount;
    String pluralization = taskAmount == 1 ? '' : 's';
    return '$taskAmount task$pluralization';
  }

  // Private methods:
  void _removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
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

  Alert _createAlert({int index, BuildContext context, String message = ''}) {
    return (Alert(
      context: context,
      type: AlertType.warning,
      title: "Are you sure?",
      // desc: message,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _removeTask(index);
            Navigator.of(context).pop();
          },
          width: 120,
        ),
        DialogButton(
          child: Text(
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        ),
      ],
    ));
  }
}
