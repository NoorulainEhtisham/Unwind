import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'mood_record.dart';

class MoodRecordDatabase extends ChangeNotifier{

  static final List<Appointment> _moodRecord = <Appointment>[];

  List<Appointment> get record => _moodRecord;

  Future<void> addMoodRecord(int _moodColor, String _moodType, DateTime _date) async{
    CollectionReference moodHistory = FirebaseFirestore.instance.collection("moodHistory");
    final moodRecordTemp = MoodRecord(moodColor: _moodColor, moodType: _moodType, startTime: _date, endTime: _date.add(const Duration(hours: 2)));
    moodHistory
            .add(moodRecordTemp.toJson())
            .then((value) => _moodRecord.add(Appointment(startTime: _date, endTime: _date.add(const Duration(hours: 2)), subject: _moodType, color: Color(_moodColor))))
            .catchError((error) => print("Failed to add use: $error"));
    notifyListeners();
  }

  void getMoodHistory() {
   // _moodRecord.clear();
    //setState(() {});
    FirebaseFirestore.instance.collection('moodHistory').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _moodRecord.add(MoodRecord.fromJson(doc.data() as Map<String, dynamic>));
      });
     // setState(() {});
    });
  }
}