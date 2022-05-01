import 'package:unwind_project/models/model_abstract.dart';

import '../entities/cognitive_distortions.dart';

class EntryModel implements Model {
  String id = "";
  String title;
  DateTime date;
  String note;
  bool isSelected;
  String cgnType;
  String cgnExample;

  EntryModel(
      {docID = "",
      required this.title,
      required this.note,
      required this.date,
      required this.cgnType,
      required this.cgnExample,
      required this.isSelected}) {
    this.id = docID;
  }

  // set ObjectID(String docID)=> id = docID;

  @override
  static EntryModel fromJson(Map<String, dynamic> json, String documentID) {
    return EntryModel(
        docID: documentID,
        title: json['title'],
        note: json['note'],
        date: json['date'].toDate(),
        cgnType: json['cgnType'],
        cgnExample: json['cgnExample'],
        isSelected: json['isSelected']);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['note'] = note;
    data['date'] = date;
    data['isSelected'] = isSelected;
    data['cgnType'] = cgnType;
    data['cgnExample'] = cgnExample;

    return data;
  }
}
