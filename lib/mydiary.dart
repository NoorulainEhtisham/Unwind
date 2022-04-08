import 'dart:math';

import 'package:flutter/cupertino.dart';
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
  List<Entry> selectedEntries = [];
  bool settings = false;
  final List<Color> _colors = [
    Color.fromRGBO(241, 209, 252, 1),
    Color.fromRGBO(252, 219, 248, 1),
    Color.fromRGBO(201, 241, 255, 1),
    Color.fromRGBO(232, 250, 255, 1),
    Color.fromRGBO(197, 217, 252, 1),
  ];

  @override
  Widget build(BuildContext context) {
    _entries = context.watch<Entries>().entries;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 1c
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Text(
              'My Diary',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 10,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.all(2.0)),
                itemCount: _entries.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  tileColor: _colors[index % _colors.length],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text(_entries[index].title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('dd MMMM yyyy')
                          .format(_entries[index].date)),
                      Text(
                        _entries[index].note,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                  leading: settings
                      ? Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          value: _entries[index].isSelected,
                          onChanged: (value) {
                            _entries[index].isSelected = value!;
                            if (_entries[index].isSelected) {
                              selectedEntries.add(_entries[index]);
                            } else {
                              selectedEntries.remove(_entries[index]);
                            }
                            setState(() {});
                          })
                      : null,
                  onLongPress: () {
                    settings = true;
                    setState(() {});
                  },
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DiaryEntry(entry: _entries[index])));
                  },
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: !settings
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DiaryEntry()));
              },
              tooltip: 'Add Entry',
              child: const Icon(Icons.edit_outlined),
            )
          : null,
      bottomSheet: settings
          ? Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      bool _deleteNote = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                    'Are you sure you want to delete selected notes?'),
                                content: const Text(
                                    'The selected notes will be removed'),
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
                      if (_deleteNote) {
                        for (var temp in selectedEntries) {
                          context.read<Entries>().DeleteEntry(temp);
                          setState(() {});
                        }
                      }
                      settings = false;
                      setState(() {}); //context
                    },
                    tooltip: 'Delete Note',
                  ),
                  IconButton(
                    onPressed: () {
                      settings = false;
                      for (var temp in selectedEntries) {
                        context.read<Entries>().setSelected(temp, false);
                      }
                      selectedEntries.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.close),
                    tooltip: 'Cancel',
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
