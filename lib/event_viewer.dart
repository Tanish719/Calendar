import 'Events.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'package:calenderapp/event_provider.dart';
import 'package:calenderapp/fab.dart';

class EventDetails extends StatelessWidget {
  final Event event;
  const EventDetails({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          ListTile(
            title: Text(
              event.title,
            ),
            subtitle: Text(
              event.from
            ),
          )
        ],
      ),
    );
  }
}
