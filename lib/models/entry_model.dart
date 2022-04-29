

import 'package:unwind_project/models/model_abstract.dart';

import '../entities/cognitive_distortions.dart';

class EntryModel implements Model{
  String id = "";
  String title;
  DateTime date;
  String note;
  bool isSelected;
  CgnDistort cognitiveDistortion;

  EntryModel({required this.title, required this.note, required this.date, required this.cognitiveDistortion, required this.isSelected});

  set ObjectID(String docID)=> id = docID;

  @override
  static EntryModel fromJson(Map<String, dynamic> json) {
    return EntryModel(
        title: json['title'],
        note: json['note'],
        date: json['date'],
        cognitiveDistortion: json['cognitiveDistortion'],
        isSelected: json['isSelected']
    );
  }


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['note'] = note;
    data['date'] = date;
    data['isSelected'] = isSelected;
    data['cognitiveDistortion'] = cognitiveDistortion;

    return data;
  }
}