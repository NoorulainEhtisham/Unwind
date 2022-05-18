
import 'package:unwind_project/entities/cognitive_distortions.dart';

class Entry {
  String id = "";
  String title;
  String uid;
  DateTime date;
  String note;
  bool isSelected = false;
  CgnDistort? cognitivedistortion;

  Entry({this.id = "", this.uid = "", this.title = 'Title', required this.date, required this.note, this.cognitivedistortion});

  void setCD(CgnDistort c) => this.cognitivedistortion = c;

  void setSelected(bool value) => isSelected = value;

  void setDocID(String docID)=> id = docID;

  String get documentID=>id;

  set Title(String title) => this.title = title;

  @override
  String toString() {
    // TODO: implement toString
    return "{id: $documentID, title: $title, date: $date, note: $note, isSelected: $isSelected, Cognitive Distortion type: ${cognitivedistortion!.type}, example: ${cognitivedistortion!.example}}";
  }

}

