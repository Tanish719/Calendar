import 'package:calenderapp/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calenderapp/Events.dart';
import 'package:calenderapp/fab.dart';
import 'package:calenderapp/event_provider.dart';
import 'package:calenderapp/event_data_source.dart';

void main() {
  runApp(const MyApp());
}
// ignore_for_file: prefer_const_constructors

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            brightness: Brightness.light,
            accentColor: Colors.red,
            primaryColor: Colors.white,
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.red,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      );
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
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventEditingPage()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          bottom: false,
          child: SfCalendar(
            view: CalendarView.month,
            onLongPress: (details) {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.setDate(details.date!);
            },
            monthCellBuilder:
                (BuildContext buildContext, MonthCellDetails details) {
              final Color defaultColor =
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.black54
                      : Colors.white;
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: defaultColor, width: 0.5)),
                child: Center(
                  child: Text(
                    details.date.day.toString(),
                  ),
                ),
              );
            },
            scheduleViewSettings: ScheduleViewSettings(
                weekHeaderSettings: WeekHeaderSettings(
                  startDateFormat: 'dd MMM',
                  endDateFormat: 'dd MMM',
                ),
                appointmentTextStyle: TextStyle(
                  color: Colors.black,
                ),
                monthHeaderSettings: MonthHeaderSettings(
                    backgroundColor: Colors.red,
                    monthTextStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            headerStyle: CalendarHeaderStyle(
                textAlign: TextAlign.center,
                textStyle:
                    TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            allowedViews: [CalendarView.month, CalendarView.schedule],
            allowAppointmentResize: true,
            timeSlotViewSettings: TimeSlotViewSettings(
                timeIntervalHeight: 200, timeIntervalWidth: 200),
            initialSelectedDate: DateTime.now(),
            dataSource: EventDataSource(events),
            showNavigationArrow: true,
            todayHighlightColor: Colors.red,
            showCurrentTimeIndicator: true,
            showWeekNumber: true,
            weekNumberStyle: WeekNumberStyle(
              backgroundColor: Colors.red,
              textStyle: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
            showDatePickerButton: true,
            monthViewSettings: MonthViewSettings(
                //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                showTrailingAndLeadingDates: false,
                monthCellStyle:
                    MonthCellStyle(backgroundColor: Colors.transparent),
                appointmentDisplayCount: 10,
                showAgenda: true,
                agendaItemHeight: 55,
                agendaStyle: AgendaStyle(
                  backgroundColor: Colors.black,
                  dateTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  appointmentTextStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  dayTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Source Sans Pro',
                  ),
                )),
          )),
    );
  }
}
