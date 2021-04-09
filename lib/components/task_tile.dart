// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:
import 'package:todoey_flutter/components/task_checkbox.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TaskTile extends StatelessWidget {
  // Properties:
  final Key key;
  final String taskText;
  final bool isChecked;
  final Function onChangedHandler;

// Constructor:
  const TaskTile({
    this.key,
    this.taskText,
    this.isChecked,
    this.onChangedHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskText,
        style: TextStyle(
          decoration: (isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        // onChanged: (newValue) => onChangeHandler(newValue),
        // onChanged: onChangedHandler(key),
        onChanged: onChangedHandler,
      ),
    );
  }
}
