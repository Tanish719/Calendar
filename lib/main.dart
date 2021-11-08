import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calenderapp/Events.dart';
import 'package:calenderapp/fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Events()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFF1D3557),
      ),
      body: SafeArea(
          child: SfCalendar(
        view: CalendarView.month,
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
        ),
        allowedViews: [
          CalendarView.week,
          CalendarView.month,
        ],
        timeSlotViewSettings: TimeSlotViewSettings(
          timeIntervalHeight: 100,
        ),
        dataSource: MeetingDataSource(_getDataSource()),
        showNavigationArrow: true,
        todayHighlightColor: Color(0xFF457B9D),
        showCurrentTimeIndicator: true,
        showWeekNumber: true,
        weekNumberStyle: WeekNumberStyle(
          backgroundColor: Color(0xFF1D3557),
          textStyle: TextStyle(color: Color(0xFFDAD1D4), fontSize: 15),
        ),
        showDatePickerButton: true,
        monthViewSettings: MonthViewSettings(
            //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            appointmentDisplayCount: 2,
            showAgenda: true,
            agendaItemHeight: 80,
            agendaStyle: AgendaStyle(
                backgroundColor: Color(0xFF555566),
                dateTextStyle: TextStyle(
                  color: Color(0xFFDAD1D4),
                  fontSize: 20,
                ),
                dayTextStyle: TextStyle(
                  color: Color(0xFFDAD1D4),
                  fontSize: 25,
                  fontFamily: 'Source Sans Pro',
                ))),
      )),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF2F9C95), false));
  meetings.add(Meeting(
      'Kill Aditi', startTime, endTime, const Color(0xFFA04668), false));
  meetings.add(Meeting('Doctor', DateTime(2021, 12, 18, 10),
      DateTime(2021, 12, 18, 12), Colors.purple, false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}


