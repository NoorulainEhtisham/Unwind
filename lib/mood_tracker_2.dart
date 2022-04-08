import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'calendar_data_source.dart';
import 'database.dart';

class MoodTrackerScreen2 extends StatefulWidget {
  const MoodTrackerScreen2({Key? key}) : super(key: key);

  @override
  State<MoodTrackerScreen2> createState() => _MoodTrackerScreen2State();
}

class _MoodTrackerScreen2State extends State<MoodTrackerScreen2> {

  CalendarController _calendarController = CalendarController();

  @override
  initState() {
    _calendarController.displayDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(8)),
            const Text(
              "Mood History",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(61, 90, 128, 100),
              ),
            ),
            const Padding(padding: EdgeInsets.all(18)),
            Expanded(
              child: SfCalendar(
                view: CalendarView.month,
                showDatePickerButton: true,
                allowViewNavigation: true,
                allowedViews: const [CalendarView.day,  CalendarView.week, CalendarView.month],
                controller: _calendarController,
                headerHeight: 70,
                headerStyle: const CalendarHeaderStyle(
                  textAlign:  TextAlign.center,
                  textStyle: TextStyle(
                    fontSize : 23,
                    letterSpacing: 4,
                  ),
                ),
                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                ),
                dataSource: MeetingDataSource(Database().getApp()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



