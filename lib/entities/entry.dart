
import 'package:flutter/cupertino.dart';
import 'package:unwind_project/entities/cognitive_distortions.dart';

class Entry {
  String id = "";
  String title = 'Title';
  DateTime date;
  String note;
  bool isSelected = false;
  CgnDistort cognitivedistortion = CgnDistort(type: '', example: '');

  Entry({id, title, required this.date, required this.note, isSelected, cognitiveDistortion}) {
    this.title = title;
    this.isSelected = isSelected;
    this.cognitivedistortion = cognitivedistortion;
    this.id = id;
  }

  void setCD(CgnDistort c) => this.cognitivedistortion = c;

  void setSelected(bool value) => isSelected = value;

  void setDocID(String docID)=> this.id = docID;

  String get documentID=>id;

  set Title(String title) => this.title = title;

}

