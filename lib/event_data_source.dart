import 'package:calenderapp/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calenderapp/Events.dart';
import 'package:calenderapp/fab.dart';
import 'package:calenderapp/event_provider.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  //
  Color getColor(int index) => getEvent(index).backgroundcolor;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;
}
