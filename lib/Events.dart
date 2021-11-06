import 'package:calenderapp/main.dart';
import 'package:flutter/material.dart';
import 'package:calenderapp/main.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
        ),
        body: Center(child: Text('Hello')));
  }
}
