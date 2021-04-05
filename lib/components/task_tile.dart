// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key key,
    this.text,
    this.checked,
  }) : super(key: key);

  final String text;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        text,
        style: TextStyle(
          decoration: (checked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
      trailing: Checkbox(
        value: checked,
        onChanged: (bool newValue) {},
      ),
    );
  }
}
