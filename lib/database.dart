import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';



class Database{

  static final List<Appointment> _moodRecord = <Appointment>[];

  void addMoodRecord(String _moodType, DateTime _date, Color _moodColor ){

    final DateTime today = _date;
    final DateTime startTime = DateTime(today.year, today.month, today.day);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    _moodRecord.add(
      Appointment(startTime: startTime, endTime: endTime, subject: _moodType ,color: _moodColor),
    );
  }

  List<Appointment> getApp()
  {
    return _moodRecord;
  }

}
