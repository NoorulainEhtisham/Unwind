import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../entities/moods_type.dart';
import '../models/moods_type_model.dart';

class MoodsTypeDatabase extends ChangeNotifier{

  static final List<MoodsTypeModel> _moodsTypeData = [];
  static final List<MoodsType> _moodsTypeList = [];

  List<MoodsType> get record => _moodsTypeList;

  Future<void> addMoodTypes(String _moodName, int _iconCode, String _iconFamily, int _moodColor) async{
    CollectionReference moodHistory = FirebaseFirestore.instance.collection('moodsType');
    final moodRecordTemp = MoodsTypeModel(moodName: _moodName, iconCode: _iconCode, iconFamily: _iconFamily, moodColor: _moodColor);
    moodHistory
        .add(moodRecordTemp.toJson())
        .catchError((error) => print("Failed to add mood: $error"));
    notifyListeners();
  }

  Future<void> getMoodsType() async{
    FirebaseFirestore.instance.collection('moodsType').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _moodsTypeData.add(MoodsTypeModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
    var moods = _moodsTypeData.map((e) => MoodsType(moodName: e.moodName, iconLink: Icon(IconData(e.iconCode, fontFamily: e.iconFamily,)), moodColor: Color(e.moodColor)));
    _moodsTypeList.addAll(moods);
  }
}