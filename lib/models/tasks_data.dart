// Packages:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:collection';

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
    Task(id: 1, taskText: 'Buy milk', isChecked: false),
    Task(id: 2, taskText: 'Buy eggs', isChecked: false),
    Task(id: 3, taskText: 'Buy Cuban Bread', isChecked: true),
    Task(id: 4, taskText: 'Buy chicken', isChecked: false),
    Task(id: 5, taskText: 'Buy apples', isChecked: false),
    Task(id: 6, taskText: 'Buy pork', isChecked: false),
    Task(id: 7, taskText: 'Buy lots of Corona beer', isChecked: false),
    Task(id: 8, taskText: 'Finish this app', isChecked: false),
    Task(id: 9, taskText: 'Watch a movie', isChecked: false),
  ];

  // Getters:
  int get tasksCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // List<Task> get tasks {
  //   return _tasks;
  // }

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

  void updateTaskNew(int id, int index, String taskText, bool isChecked) {
    Task updatingTask = _tasks.firstWhere((task) => task.id == id);
    // Task updatingTask = _tasks[index];
    Task newTask = Task(id: id, isChecked: isChecked, taskText: taskText);
    // Does not works: The reference gets lost:
    // updatingTask = newTask;
    // It works
    // updatingTask.taskText = taskText;
    // It works:
    // _tasks[index] = newTask;
    // It also works:
    updatingTask.updateFrom(newTask);
    notifyListeners();
  }

  void toggleChecked(int index) {
    _tasks[index].toggleChecked();
    notifyListeners();
  }

  void reorderTasks(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    // final item = _tasks.removeAt(oldIndex);
    // _tasks.insert(newIndex, item);
    _tasks.insert(newIndex, _tasks.removeAt(oldIndex));
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
