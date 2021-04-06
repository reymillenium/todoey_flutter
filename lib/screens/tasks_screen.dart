// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:
import 'package:todoey_flutter/components/tasks_list.dart';

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

  Widget buildModalBottomSheet(BuildContext context) {
    return Expanded(
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
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  color: kLightBlueBackground,
                  fontSize: 30,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      // color: kLightBlueBackground,
                      color: Colors.red,
                      // width: 30,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kLightBlueBackground,
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      // color: Colors.red,
                      width: 6.0,
                    ),
                  ),
                ),
                style: TextStyle(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Material(
                  color: kLightBlueBackground,
                  // borderRadius: BorderRadius.circular(12.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {},
                    // minWidth: 300.0,
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
              child: TasksList(),
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
        onPressed: () {
          //
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: buildModalBottomSheet,
          );
        },
      ),
    );
  }
}
