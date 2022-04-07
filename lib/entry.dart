
import 'package:flutter/cupertino.dart';
import 'package:unwind_project/cognitive_distortions.dart';

class Entry {
  static int key = 0;
  String title = 'Title';
  DateTime date;
  String note;
  bool isSelected = false;
  CgnDistort cognitivedistortion = CgnDistort(type: '', example: '');

  Entry({title, required this.date, required this.note}) {
    this.title = title;
  }

  void setCD(CgnDistort c) => this.cognitivedistortion = c;

  void setSelected(bool value) => isSelected = value;

  int get getkey=>key;

  void incKey()=>key++;

  void setTitle(String title) => this.title = title;

}

class Entries extends ChangeNotifier {
  List<Entry> _entries = [];

  List<Entry> get entries => _entries;

  void setSelected(Entry entry, bool value) {
    int index = _entries.indexOf(entry);
    _entries[index].setSelected(value);
    notifyListeners();
  }

  void setCognitiveDistortion(Entry entry, CgnDistort cd) {
    int index = _entries.indexOf(entry);
    _entries[index].setCD(cd);
    notifyListeners();
  }

  void EditEntry(Entry entry) {
    for(var ent in _entries) {
      if(ent.getkey==entry.getkey) {
        _entries.remove(ent);
        break;
      }
    }
    AddEntry(entry);
    notifyListeners();
  }

  void DeleteEntry(Entry entry) {
    if(_entries.contains(entry)) {
      _entries.remove(entry);
    } else {
      print(entries);
    }
    notifyListeners();
  }

  void AddEntry(Entry entry) {
    _entries.add(entry);
    entry.incKey();
    //print("Key = ${entry.getkey}");
    notifyListeners();
  }
}