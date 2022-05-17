import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../entities/moods_type.dart';
import '../models/moods_type_model.dart';
import '../network/firebase_call.dart';

class MoodsTypeDatabase extends ChangeNotifier{

  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'moodsType');

  List<MoodsType> _moodsTypeList = [];

  Future<void> addMoodTypes(String _moodName, int _iconCode, String _iconFamily, int _moodColor) async{
    final moodRecordTemp = MoodsTypeModel(moodName: _moodName, iconCode: _iconCode, iconFamily: _iconFamily, moodColor: _moodColor);
    firebaseCall.add(moodRecordTemp.toJson()).then((value){
      print("Value : $value");
    });
    notifyListeners();
  }

  Future<List<MoodsType>> getMoodsType() async{
    List<MoodsTypeModel> _moodsTypeData = [];
    await firebaseCall.getAll().then((List value) => _moodsTypeData = value
        .map((e) => MoodsTypeModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());

    final mood = _moodsTypeData.map((e) => MoodsType(moodName: e.moodName, iconLink: Icon(IconData(e.iconCode, fontFamily: e.iconFamily,)), moodColor: Color(e.moodColor))).toList();
    _moodsTypeList = mood;
    return _moodsTypeList;
  }
}