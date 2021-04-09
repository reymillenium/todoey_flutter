// Packages:
import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

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
    Task(taskText: 'Buy milk', isChecked: false),
    Task(taskText: 'Buy eggs', isChecked: false),
    Task(taskText: 'Buy bread', isChecked: true),
  ];
  final _listViewScrollController = ScrollController();

  List<Widget> getTaskList() {
    List<Widget> taskList = [];

    tasks.asMap().forEach((index, task) {
      Widget newTask = TaskTile(
        taskText: task.taskText,
        isChecked: task.isChecked,
        key: Key(index.toString()),
        // onChangedHandler: (index) => onChangedHandler(index),
        onChangedHandler: onChangedHandler(index),
      );
      taskList.add(newTask);
    });

    return taskList;
  }

  Function onChangedHandler(int index) {
    return (bool newValue) {
      setState(() {
        // tasks[index].isChecked = newValue;
        tasks[index].toggleChecked();
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
    //   controller: _listViewScrollController,
    //   children: getTaskList(),
    // );
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
      controller: _listViewScrollController,
      itemBuilder: (context, index) {
        return TaskTile(
          key: Key(index.toString()),
          taskText: tasks[index].taskText,
          isChecked: tasks[index].isChecked,
          onChangedHandler: onChangedHandler(index),
          // onChangedHandler: (newValue) {},
        );
      },
      itemCount: tasks.length,
    );
  }
}
