import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MoodRecord {
  int moodColor;
  String moodType;
  DateTime startTime;
  DateTime endTime;

  MoodRecord({required this.moodColor, required this.moodType, required this.startTime, required this.endTime});
}
