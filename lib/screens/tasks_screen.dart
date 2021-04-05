// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

// Helpers:

// Utilities:
import 'package:todoey_flutter/utilities/constants.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      backgroundColor: kLightBlueBackground,
      body: Container(
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
              height: 10.0,
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
            Expanded(
              child: Container(
                // width: MediaQuery.of(context).size.width,
                // height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
