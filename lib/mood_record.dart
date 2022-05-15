import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MoodRecord {
  int moodColor;
  String moodType;
  DateTime startTime;
  DateTime endTime;

  MoodRecord({required this.moodColor, required this.moodType, required this.startTime, required this.endTime});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['moodColor'] = moodColor;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['moodType'] = moodType;

    return data;
  }

    static Appointment fromJson(Map<String, dynamic> json) => Appointment(
    subject: json['moodType'] ?? '',
    startTime: json['startTime'].toDate() ?? '',
    endTime: json['endTime'].toDate() ?? '',
    color: Color(json['moodColor']),
  );
}
