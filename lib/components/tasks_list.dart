// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:
import 'package:todoey_flutter/components/task_tile.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksList extends StatelessWidget {
  final _listViewScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
      controller: _listViewScrollController,
      children: <Widget>[
        TaskTile(
          text: 'Buy milk',
          checked: false,
        ),
        TaskTile(
          text: 'Buy eggs',
          checked: false,
        ),
        TaskTile(
          text: 'Buy bread',
          checked: true,
        ),
      ],
    );
  }
}