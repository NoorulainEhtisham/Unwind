import 'package:unwind_project/entities/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:unwind_project/entities/cognitive_distortions.dart';
import 'package:unwind_project/models/entry_model.dart';
import 'package:unwind_project/network/firebase_call.dart';

import '../models/model_abstract.dart';

class Entries extends ChangeNotifier {
  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'entries');
  List<Entry> _entries = [];

  List<Entry> get entries => _entries;

  void setSelected(String docID, bool value) {
    int index = _entries.indexWhere((element) => element.documentID == docID);
    _entries[index].setSelected(value);
    notifyListeners();
  }

  getEntries() {
    List data = firebaseCall.getAll() as List;
    final entryList = data
        .map((e) => EntryModel.fromJson(e as Map<String, dynamic>))
        .toList();
    _entries = entryList
        .map((e) => Entry(
            id: e.id,
            title: e.title,
            date: e.date,
            note: e.note,
            isSelected: e.isSelected,
            cognitiveDistortion: e.cognitiveDistortion))
        .toList();
  }

  void setCognitiveDistortion(Entry entry, CgnDistort cd) {
    int index = _entries.indexOf(entry);
    _entries[index].setCD(cd);
    notifyListeners();
  }

  void EditEntry(Entry entry) {
    for (var ent in _entries) {
      if (ent.documentID == entry.documentID) {
        _entries.remove(ent);
        break;
      }
    }
    AddEntry(entry);
    notifyListeners();
  }

  void DeleteEntry(Entry entry) {
    if (_entries.contains(entry)) {
      _entries.remove(entry);
    } else {
      print(entries);
    }
    notifyListeners();
  }

  Future<void> AddEntry(Entry entry) async {
    Model ent =
    EntryModel(
        title: entry.title,
        note: entry.note,
        date: entry.date,
        cognitiveDistortion: entry.cognitivedistortion,
        isSelected: entry.isSelected);
    String id = firebaseCall.add(ent.toJson()) as String;
    entry.setDocID(id);
    _entries.add(entry);
    notifyListeners();
  }
}
