// Packages:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens:

// Models:
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_data.dart';

// Components:
import 'package:todoey_flutter/components/tasks_list.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class UpdateTaskScreen extends StatefulWidget {
  // Properties:
  final int index;
  final String taskText;

  // Constructor:
  UpdateTaskScreen({
    this.index,
    this.taskText,
  });

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  // Properties:
  int _index;
  String taskText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = widget.index;
    taskText = widget.taskText;
  }

  @override
  Widget build(BuildContext context) {
    TasksData tasksData = Provider.of<TasksData>(context, listen: false);
    void Function(int, String) onUpdateTaskHandler = (index, newTaskText) => tasksData.updateTask(index, newTaskText);

    return SingleChildScrollView(
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
                'Update Task',
                style: TextStyle(
                  color: kLightBlueBackground,
                  fontSize: 30,
                ),
              ),

              // Input
              TextFormField(
                autocorrect: false,
                initialValue: widget.taskText,
                autofocus: true,
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
                onChanged: (String newText) {
                  setState(() {
                    taskText = newText;
                  });
                },
              ),

              // Update button:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Material(
                  color: kLightBlueBackground,
                  // borderRadius: BorderRadius.circular(12.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      onUpdateTaskHandler(_index, taskText);
                      Navigator.pop(context);
                    },
                    // minWidth: 300.0,
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Text(
                      'Update',
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
}
