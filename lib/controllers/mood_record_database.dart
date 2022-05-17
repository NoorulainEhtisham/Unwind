import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unwind_project/models/mood_record_model.dart';
import 'package:unwind_project/models/moods_type_model.dart';

import '../network/firebase_call.dart';

class MoodRecordDatabase extends ChangeNotifier{

  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'moodHistory');

  List<Appointment> _moodRecord = <Appointment>[];

  List<Appointment> get record => _moodRecord;

  Future<void> addMoodRecord(int _moodColor, String _moodType, DateTime _date) async{
    final moodRecordTemp = MoodRecordModel(moodColor: _moodColor, moodType: _moodType, startTime: _date, endTime: _date.add(const Duration(hours: 2)));
    firebaseCall
        .add(moodRecordTemp.toJson()).then((value){
      print("Value : $value");
    });
    _moodRecord.add(Appointment(startTime: _date, endTime: _date.add(const Duration(hours: 2)), subject: _moodType, color: Color(_moodColor)));
    notifyListeners();
  }

  void getMoodHistory() {
    FirebaseFirestore.instance.collection('moodHistory').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _moodRecord.add(MoodRecordModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
  }

  Future<List<Appointment>> getHistory() async{
    List<Appointment> _moodData = [];
    await firebaseCall.getAll().then((List value) => _moodData = value
            .map((e) => MoodRecordModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
    _moodRecord = _moodData;
    print(_moodRecord.length);
    return _moodData;
  }

}