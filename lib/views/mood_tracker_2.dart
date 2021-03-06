import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unwind_project/controllers/mood_record_database.dart';
import '../calendar_data_source.dart';
import '../heading_widget.dart';

class MoodTrackerScreen2 extends StatefulWidget {
  const MoodTrackerScreen2({Key? key}) : super(key: key);

  @override
  State<MoodTrackerScreen2> createState() => _MoodTrackerScreen2State();
}

class _MoodTrackerScreen2State extends State<MoodTrackerScreen2> {
  List<Appointment> _history = [];
  late bool isLoading;
  final CalendarController _calendarController = CalendarController();

  getData() {
    context.read<MoodRecordDatabase>().getHistory().then((value) {
      _history = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  initState() {
    _calendarController.displayDate = DateTime.now();
    getData();
    isLoading = false;
    //MoodRecordDatabase().getMoodHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const HeadingWidget(title: "Mood History"),
            Expanded(
              child: SfCalendar(
                view: CalendarView.month,
                //todayHighlightColor: Color(0x00c5d9fc),
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
                  //showTrailingAndLeadingDates: false,
                ),
                dataSource: MeetingDataSource(_history),
                appointmentTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



