// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskText,
        style: TextStyle(
          decoration: (isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
      trailing: Checkbox(
        activeColor: kLightBlueBackground,
        value: isChecked,
        onChanged: (bool newValue) {
          setState(() {
            isChecked = newValue;
          });
        },
      ),
    );
  }
}

// class TaskCheckbox extends StatefulWidget {
//   // const TaskCheckbox({
//   //   Key key,
//   //   @required this.checked,
//   // }) : super(key: key);
//
//   // final bool checked;
//
//   @override
//   _TaskCheckboxState createState() => _TaskCheckboxState();
// }
//
// class _TaskCheckboxState extends State<TaskCheckbox> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: kLightBlueBackground,
//       value: isChecked,
//       onChanged: (bool newValue) {
//         setState(() {
//           isChecked = newValue;
//         });
//       },
//     );
//   }
// }
