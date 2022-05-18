import 'package:unwind_project/entities/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:unwind_project/entities/cognitive_distortions.dart';
import 'package:unwind_project/models/entry_model.dart';
import 'package:unwind_project/network/firebase_call.dart';

import '../models/model_abstract.dart';

class EntryProvider extends ChangeNotifier {
  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'entries');
  List<Entry> _entries = [];
  late Model model;

  void setSelected(String docID, bool value) {
    int index = _entries.indexWhere((element) => element.documentID == docID);
    _entries[index].setSelected(value);
    notifyListeners();
  }

  Future<List<Entry>> getEntries() async {
    List<EntryModel> entryList = [];
    await firebaseCall.getAll().then((List value) => entryList = value
        .map((e) => EntryModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());

    final entries = entryList
        .map((e) => Entry(
            id: e.id,
            uid: e.uid,
            title: e.title,
            date: e.date,
            note: e.note,
            cognitivedistortion:
                CgnDistort(type: e.cgnType, example: e.cgnExample)))
        .toList();
    _entries = entries;
    return _entries;
  }

  Future<Entry> getEntry(String documentID) async {
    EntryModel _model = EntryModel(
        title: "", note: "", date: DateTime.now(), cgnType: "", cgnExample: "");
    await firebaseCall.getOne(documentID).then((value) => _model =
        EntryModel.fromJson(value as Map<String, dynamic>, documentID));
    return Entry(
        id: documentID,
        title: _model.title,
        date: _model.date,
        note: _model.note,
        cognitivedistortion:
            CgnDistort(type: _model.cgnType, example: _model.cgnExample));
  }

  void setCognitiveDistortion(Entry entry, CgnDistort cd) {
    int index = _entries.indexOf(entry);
    _entries[index].setCD(cd);
    notifyListeners();
  }

  void editEntry(Entry entry) {
    int index = -1;
    print("ID: ${entry.documentID}");
    model = EntryModel(
      title: entry.title,
      note: entry.note,
      date: entry.date,
      cgnType: entry.cognitivedistortion != null
          ? entry.cognitivedistortion!.type
          : '',
      cgnExample: entry.cognitivedistortion != null
          ? entry.cognitivedistortion!.example
          : '',
    );
    firebaseCall.edit(entry.documentID, model.toJson()).then((value) {
      if ((index = _entries.indexWhere(
              (element) => element.documentID == entry.documentID)) !=
          -1) {
        _entries[index] = entry;
      }
      notifyListeners();
    });
  }

  void deleteEntry(String documentID) {
    firebaseCall.delete(documentID).then((value) {
      _entries.removeWhere((element) => element.documentID == documentID);
      notifyListeners();
    });
  }

  Future<String> addEntry(Entry entry) async {
    String id = "";
    model = EntryModel(
      uid: entry.uid,
      title: entry.title,
      note: entry.note,
      date: entry.date,
      cgnType: entry.cognitivedistortion != null
          ? entry.cognitivedistortion!.type
          : "",
      cgnExample: entry.cognitivedistortion != null
          ? entry.cognitivedistortion!.example
          : "",
    );
    await firebaseCall.add(model.toJson()).then((value) {
      print("Value : $value");
      entry.setDocID(value);
      _entries.add(entry);
    });
    notifyListeners();
    return entry.documentID;
  }
}
