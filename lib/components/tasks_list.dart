// Packages:
import 'package:flutter/material.dart';

// Screens:

// Models:
import 'package:todoey_flutter/models/task.dart';

// Components:
import 'package:todoey_flutter/components/task_tile.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // Properties:
  List<Task> tasks = [
    Task(taskText: 'Buy milk'),
    Task(taskText: 'Buy eggs'),
    Task(taskText: 'Buy bread', isChecked: true),
  ];
  final _listViewScrollController = ScrollController();

  List<Widget> getTaskList() {
    List<Widget> taskList = [];

    tasks.forEach((task) {
      Widget newTask = TaskTile(
        taskText: task.taskText,
        isChecked: task.isChecked,
      );
      taskList.add(newTask);
    });

    return taskList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
      controller: _listViewScrollController,
      children: getTaskList(),
    );
  }
}
