// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksScreen extends StatelessWidget {
  final _listViewScrollController = ScrollController();

  void scrollListViewSmoothly() {
    _listViewScrollController.animateTo(
      _listViewScrollController.position.maxScrollExtent,
      // duration: Duration(seconds: 1),
      duration: Duration(milliseconds: 500),
      // curve: Curves.fastOutSlowIn,
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      backgroundColor: kLightBlueBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: kLightBlueBackground,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '12 tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),

          // List of tasks Component:
          Expanded(
            child: Container(
              // padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
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
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kLightBlueBackground,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
