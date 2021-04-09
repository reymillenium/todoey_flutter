// Packages:
import 'package:flutter/material.dart';

// Screens:
import 'package:todoey_flutter/screens/add_task_screen.dart';

// Models:
import 'package:todoey_flutter/models/task.dart';

// Components:
import 'package:todoey_flutter/components/tasks_list.dart';
import 'package:todoey_flutter/components/task_tile.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // Properties:
  List<Task> tasks = [
    Task(taskText: 'Buy milk', isChecked: false),
    Task(taskText: 'Buy eggs', isChecked: false),
    Task(taskText: 'Buy bread', isChecked: true),
  ];
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

  Function onChangedHandler(int index) {
    return (bool newValue) {
      setState(() {
        // tasks[index].isChecked = newValue;
        tasks[index].toggleChecked();
      });
    };
  }

  void onPressedHandler(String taskText) {
    Task newTask = Task(taskText: taskText);
    setState(() {
      tasks.add(newTask);
    });
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
              child: TasksList(
                tasks: tasks,
                // onChangedHandler: (index) => onChangedHandler(index),
                onChangedHandler: onChangedHandler,
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
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTaskScreen(
              onPressedHandler: onPressedHandler,
            ),
          );
        },
      ),
    );
  }
}
