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
  final _listViewScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // TasksData tasksData = Provider.of<TasksData>(context, listen: true);
    List<Task> tasks = Provider.of<TasksData>(context, listen: true).tasks();
    var onDeleteTaskHandler = (index) => Provider.of<TasksData>(context, listen: false).deleteTask(index);
    Function onChangedHandler = (index) => (bool newValue) => Provider.of<TasksData>(context, listen: false).toggleChecked(index);

    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
      controller: _listViewScrollController,
      itemBuilder: (context, index) {
        return TaskTile(
          key: Key(index.toString()),
          taskText: tasks[index].taskText,
          isChecked: tasks[index].isChecked,
          onChangedHandler: onChangedHandler(index),
          onDeleteTaskHandler: () => onDeleteTaskHandler(index),
        );
      },
      itemCount: tasks.length,
    );
  }
}
