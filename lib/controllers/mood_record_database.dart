import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unwind_project/models/mood_record_model.dart';

class MoodRecordDatabase extends ChangeNotifier{

  static final List<Appointment> _moodRecord = <Appointment>[];

  List<Appointment> get record => _moodRecord;

  Future<void> addMoodRecord(int _moodColor, String _moodType, DateTime _date) async{
    CollectionReference moodHistory = FirebaseFirestore.instance.collection("moodHistory");
    final moodRecordTemp = MoodRecordModel(moodColor: _moodColor, moodType: _moodType, startTime: _date, endTime: _date.add(const Duration(hours: 2)));
    moodHistory
            .add(moodRecordTemp.toJson())
            .catchError((error) => print("Failed to add use: $error"));
    notifyListeners();
  }

  void getMoodHistory() {
    FirebaseFirestore.instance.collection('moodHistory').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _moodRecord.add(MoodRecordModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
  }
}