// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:
import 'package:todoey_flutter/components/task_checkbox.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TaskTile extends StatefulWidget {
  // Properties:
  final taskText;

  // Constructor:
  const TaskTile({
    Key key,
    this.taskText,
  }) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // Properties:
  String taskText;
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskText = widget.taskText;
  }

  void _onChangedHandler(bool newValue) {
    setState(() {
      isChecked = newValue;
    });
  }

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
        // onChanged: (newValue) => _onChangeHandler(newValue),
        onChanged: _onChangedHandler,
      ),
    );
  }
}
