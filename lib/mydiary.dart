import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/diaryEntry.dart';

import 'entry.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  late List<Entry> _entries;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    _entries = context
        .watch<Entries>()
        .entries;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // 1c
          foregroundColor: Colors.black,
          title: Text(
            'My Diary',
            style: Theme
                .of(context)
                .textTheme
                .headline2,
            textAlign: TextAlign.left,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: _entries.length,
                    itemBuilder: (context, index) =>
                        Card(
                          child: ListTile(
                            title: Text(_entries[index].title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DateFormat('dd MMMM yyyy').format(
                                    _entries[index].date)),
                                Text(
                                    _entries[index].note.substring(
                                    0,
                                        _entries[index].note.length > MediaQuery.of(context).size.width.toInt()
                                            ? MediaQuery.of(context).size.width.toInt()
                                            : _entries[index].note.length
                                    )
                                ),
                              ],
                            ),
                            leading: Checkbox(
                                value: _entries[index].isSelected, onChanged: (value) {
                              _entries[index].isSelected = value!;
                                  if (_entries[index].isSelected) {
                                    _showDeleteCard(context, _entries[index]);
                                  }
                                  setState(() {});
                                }
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>
                                      DiaryEntry(
                                        entry: Entry(
                                            title: _entries[index].title,
                                            date: _entries[index].date,
                                            note: _entries[index].note
                                        ),
                                      )
                                  )
                              );
                            },
                          ),
                        )
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>
                DiaryEntry()
                )
            );
          },
          tooltip: 'Add Entry',
          child: const Icon(Icons.edit_outlined),
        )
    );
  }


  void _showDeleteCard(context, Entry _entry) {
    bool _deleteNote;
    showModalBottomSheet(
        context: context, builder: (context) =>
        ListTile(
          title: const Text('Delete Note'),
          leading: const Icon(Icons.delete),
          onTap: () async {
            _deleteNote = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                      'Are you sure you wish to delete the note?'),
                  content: const Text(
                      'The following note will be removed'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('OK'))
                  ],
                ));
            if(_deleteNote) {
              context.read<Entries>().DeleteEntry(_entry);
              setState(() {
              });
            }
            Navigator.of(context).pop();
            //context
          },
        )
    );
  }
}