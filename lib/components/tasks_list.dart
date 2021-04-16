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
    return Consumer<TasksData>(
      builder: (context, tasksData, child) {
        List<Task> tasks = tasksData.tasks;
        void Function(int, BuildContext) onDeleteTaskHandler = (index, context) => tasksData.deleteTaskWithConfirm(index, context);
        Function onCheckTaskHandler = (index) => (bool newValue) => tasksData.toggleChecked(index);
        void Function(int, int) onReorderTasksHandler = (oldIndex, newIndex) => tasksData.reorderTasks(oldIndex, newIndex);

        // return ListView.builder(
        //   padding: const EdgeInsets.only(left: 0, top: 20, right: 0),
        //   controller: _listViewScrollController,
        //   itemBuilder: (context, index) {
        //     return TaskTile(
        //       key: Key(index.toString()),
        //       index: index,
        //       taskText: tasks[index].taskText,
        //       isChecked: tasks[index].isChecked,
        //       onCheckTaskHandler: onCheckTaskHandler(index),
        //       onDeleteTaskHandler: () => onDeleteTaskHandler(index, context),
        //     );
        //   },
        //   itemCount: tasksData.tasksCount,
        // );

        return ReorderableListView(
          children: List.generate(
            tasksData.tasksCount,
            (index) {
              return TaskTile(
                key: Key(index.toString()),
                index: index,
                taskText: tasks[index].taskText,
                isChecked: tasks[index].isChecked,
                onCheckTaskHandler: onCheckTaskHandler(index),
                onDeleteTaskHandler: () => onDeleteTaskHandler(index, context),
              );
            },
          ).toList(),
          onReorder: (int oldIndex, int newIndex) {
            onReorderTasksHandler(oldIndex, newIndex);
          },
          //Divider(color: Theme.of(context).accentColor),
        );
      },
    );
  }
}
