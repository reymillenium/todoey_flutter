// Packages:
import 'package:flutter/material.dart';

// Screens:
import 'package:todoey_flutter/screens/update_task_screen.dart';

// Components:
import 'package:todoey_flutter/components/task_checkbox.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TaskTile extends StatelessWidget {
  // Properties:
  final Key key;
  final int index;
  final String taskText;
  final bool isChecked;
  final Function onChangedHandler;
  final Function onDeleteTaskHandler;
  final Function onUpdateTaskHandler;

// Constructor:
  const TaskTile({
    this.key,
    this.index,
    this.taskText,
    this.isChecked,
    this.onChangedHandler,
    this.onDeleteTaskHandler,
    this.onUpdateTaskHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TaskCheckbox(
        isChecked: isChecked,
        // onChanged: (newValue) => onChangeHandler(newValue),
        onChanged: onChangedHandler,
      ),
      title: Text(
        taskText,
        style: TextStyle(
          decoration: (isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDeleteTaskHandler,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => UpdateTaskScreen(index: index, taskText: taskText),
              );
            },
          ),
        ],
      ),
    );
  }
}
