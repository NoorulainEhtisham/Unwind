import 'package:flutter/material.dart';

class MoodsTypeModel {
  String moodName;
  int iconCode;
  String iconFamily;
  int  moodColor;


  MoodsTypeModel({
    required this.moodName,
    required this.iconCode,
    required this.iconFamily,
    required this.moodColor,
  });

  Map<String, dynamic> toJson() {                                               //admin use
    final Map<String, dynamic> data = {};
    data['moodName'] = moodName;
    data['iconCode'] = iconCode;
    data['iconFontFamily'] = iconFamily;
    data['moodColor'] = moodColor;

    return data;
  }

  static MoodsTypeModel fromJson(Map<String, dynamic> json) => MoodsTypeModel(
    moodName: json['moodName'] ?? '',
    // iconLink: Icon(MyFlutterApp().getIcon(json['iconCode'] ?? 00000, json['iconFamily'] ?? '', )),
    iconCode: json['iconCode'] ?? 0,
    iconFamily: json['iconFontFamily'],
    //iconLink: Icon(IconData(json['iconCode'], fontFamily: json['iconFontFamily'], fontPackage: null)),
    moodColor: json['moodColor'],
  );
}