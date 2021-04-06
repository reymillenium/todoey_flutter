// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:
import 'package:todoey_flutter/components/tasks_list.dart';

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key key,
    // this.context,
  }) : super(key: key);

  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
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
      ),
    );
  }
}
