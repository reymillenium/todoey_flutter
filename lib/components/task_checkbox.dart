// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TaskCheckbox extends StatelessWidget {
  // Properties:
  final bool isChecked;
  final Function onChanged;

  // Constructor:
  const TaskCheckbox({
    Key key,
    @required this.isChecked,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: kLightBlueBackground,
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
