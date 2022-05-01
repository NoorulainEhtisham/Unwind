
import 'package:unwind_project/entities/cognitive_distortions.dart';

class Entry {
  String _id = "";
  String title = 'Title';
  DateTime date;
  String note;
  bool isSelected = false;
  CgnDistort cognitivedistortion = CgnDistort(type: '', example: '');

  Entry({id, title, required this.date, required this.note, isSelected, cognitiveDistortion}) {
    this.title = title;
    this.isSelected = isSelected;
    this.cognitivedistortion = cognitivedistortion;
    this._id = id;
  }

  void setCD(CgnDistort c) => this.cognitivedistortion = c;

  void setSelected(bool value) => isSelected = value;

  void setDocID(String docID)=> this._id = docID;

  String get documentID=>_id;

  set Title(String title) => this.title = title;

  @override
  String toString() {
    // TODO: implement toString
    return "{id: $documentID, title: $title, date: $date, note: $note, isSelected: $isSelected, Cognitive Distortion type: ${cognitivedistortion.type}, example: ${cognitivedistortion.example}}";
  }

}

