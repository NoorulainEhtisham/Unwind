import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MoodTrackerScreen2 extends StatefulWidget {
  const MoodTrackerScreen2({Key? key}) : super(key: key);

  @override
  State<MoodTrackerScreen2> createState() => _MoodTrackerScreen2State();
}

class _MoodTrackerScreen2State extends State<MoodTrackerScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                // monthViewSettings: const MonthViewSettings(
                  // monthCellStyle: MonthCellStyle(
                  //   trailingDatesBackgroundColor: Colors.deepOrange,
                  //   leadingDatesBackgroundColor: Colors.deepPurple,
                  //   todayBackgroundColor: Colors.lightGreenAccent,
                  // ),
                // ),
                dataSource: MeetingDataSource(getApp()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Appointment> getApp()
{
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 12));


  meetings.add(
    Appointment(startTime: startTime, endTime: endTime, subject: 'Hello',color: Colors.red),
  );

  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}
