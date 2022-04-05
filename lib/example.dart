import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:unwind_project/mood_record.dart';

class CalendarTest extends StatefulWidget {
  const CalendarTest({Key? key}) : super(key: key);

  @override
  State<CalendarTest> createState() => _CalendarTestState();
}

class _CalendarTestState extends State<CalendarTest> {

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget _happyIcon(String emo) => Container(
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.all(Radius.circular(1000),),
  ),
  child: Center(
    child: Text(
      emo, style: TextStyle(color: Colors.black),
    ),
  ),
);
