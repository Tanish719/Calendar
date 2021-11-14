import 'package:calenderapp/Events.dart';
import 'package:calenderapp/main.dart';
import 'package:calenderapp/fab.dart';
import 'package:calenderapp/Events.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = events.indexOf(oldEvent);
    _events[index] = newEvent;

    notifyListeners();
  }
}
