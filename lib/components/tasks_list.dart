// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

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
        ListTile(
          leading: Text('Buy milk'),
          trailing: Checkbox(
            value: false,
            onChanged: (bool newValue) {},
          ),
        ),
        ListTile(
          leading: Text('Buy eggs'),
          trailing: Checkbox(
            value: false,
            onChanged: (bool newValue) {},
          ),
        ),
        ListTile(
          leading: Text(
            'Buy bread',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          trailing: Checkbox(
            value: true,
            onChanged: (bool newValue) {},
          ),
        ),
      ],
    );
  }
}
