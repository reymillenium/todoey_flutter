// Packages:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';

// Screens:

// Models:
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

// Components:
import 'package:todoey_flutter/components/task_tile.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksList extends StatelessWidget {
  // Properties:
  final tasks;
  final Function onChangedHandler;
  final _listViewScrollController = ScrollController();

  // Constructor:
  TasksList({
    this.tasks,
    this.onChangedHandler,
  });

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

  @override
  Widget build(BuildContext context) {
    // TasksData tasksData = Provider.of<TasksData>(context, listen: true);
    // List<Task> tasks = Provider.of<TasksData>(context, listen: true).tasks();

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
