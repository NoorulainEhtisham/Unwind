
import 'package:flutter/cupertino.dart';

class Entry {
  static int key = 0;
  String title = 'Title';
  DateTime date;
  String note;
  bool isSelected = false;

  Entry({title, required this.date, required this.note}) {
    this.title = title;
  }

  void set setSelected(bool value) => isSelected = value;

  void incKey()=>key++;

  void setTitle(String title) => this.title = title;
}

class Entries extends ChangeNotifier {
  List<Entry> _entries = [];

  List<Entry> get entries => _entries;

  void EditEntry(Entry entry) {
    if(_entries.contains(entry)) {
      _entries.remove(entry);
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
    notifyListeners();
  }
}