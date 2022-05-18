import 'package:unwind_project/models/model_abstract.dart';

import '../entities/cognitive_distortions.dart';

class EntryModel implements Model {
  String id = "";
  String title;
  String uid = "";
  DateTime date;
  String note;
  String cgnType;
  String cgnExample;

  EntryModel(
      {this.id = "",
        this.uid = "",
      required this.title,
      required this.note,
      required this.date,
      required this.cgnType,
      required this.cgnExample});

  // set ObjectID(String docID)=> id = docID;

  @override
  static EntryModel fromJson(Map<String, dynamic> json, String documentID) {
    return EntryModel(
        id: documentID,
        uid: json['uid'],
        title: json['title'],
        note: json['note'],
        date: json['date'].toDate(),
        cgnType: json['cgnType'],
        cgnExample: json['cgnExample']);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['note'] = note;
    data['date'] = date;
    data['uid'] = uid;
    data['cgnType'] = cgnType;
    data['cgnExample'] = cgnExample;

    return data;
  }
}
