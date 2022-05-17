import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/cognitive_distortion_alert.dart';
import 'package:unwind_project/entities/cognitive_distortions.dart';
import 'package:unwind_project/entities/entry.dart';

import '../controllers/entry_provider.dart';

class DiaryEntry extends StatefulWidget {
  final Entry? entry;
  const DiaryEntry({Key? key, this.entry}) : super(key: key);

  @override
  State<DiaryEntry> createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  CgnDistort _cdistort = CgnDistort(type: '', example: '');
  late Entry _entry;
  late bool newEnt;
  bool isLoading = true;
  final TextEditingController _notecontroller = TextEditingController();
  final TextEditingController _titlecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.entry != null) {
      _entry = widget.entry!;
      _entry.date = DateTime.now();
      _notecontroller.text = widget.entry!.note;
      _titlecontroller.text = widget.entry!.title;
      _cdistort = widget.entry!.cognitivedistortion!;
      newEnt = false;
    } else {
      _entry = Entry(
          title: 'Title',
          date: DateTime.now(),
          note: '',
          id: '',
          cognitivedistortion: CgnDistort(type: "", example: ""));
      _titlecontroller.text = _entry.title;
      newEnt = true;
    }
    //_cdistort = _cd[0];
    setState(() {});
    // print("Entry on new screen = $_entry");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 1c
        foregroundColor: Colors.black,
        actions: [
          PopupMenuButton(
            // onSelected: (value) async {
            //   print("Pressed\n\n\n");
            //   await showDialog(
            //       context: context,
            //       builder: (context) => CognitiveDistortionAlert(
            //               onOptionChange: (bool analyze, value) {
            //             analyze ? _cdistort = value : null;
            //             setState(() {});
            //           }));
            // },
            itemBuilder: (BuildContext context) => <PopupMenuEntry> [
              PopupMenuItem(
                child: ListTile(
                  title: Text(_cdistort.notApplied()
                      ? 'No Cognitive Distortions detected'
                      : _cdistort.type),
                  subtitle: Text(_cdistort.example),
                  onTap: () async => await showDialog(
                      context: context,
                      builder: (context) => CognitiveDistortionAlert(
                              onOptionChange: (bool analyze, value) {
                            analyze ? _cdistort = value : null;
                            setState(() {});
                          })),
                ),
              )
            ],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.info),
            ),
            tooltip: 'Show Cognitive Distortion',
          )
        ],
      ),
      body:
          // isLoading
          //     ? CircularProgressIndicator()
          //     :
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: TextField(
              // _entry.title,
              controller: _titlecontroller,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
              decoration: const InputDecoration(
                  hintText: 'Title', border: InputBorder.none),
            ),
            subtitle: Text(
              DateFormat.MMMMEEEEd().format(_entry.date),
            ),
          ),
          const Text('\n'),
          Expanded(
            //color: Colors.grey,
            child: TextField(
              expands: true,
              maxLines: null,
              minLines: null,
              controller: _notecontroller,
              decoration: const InputDecoration(
                hintText: 'Write your thoughts here',
                contentPadding: EdgeInsets.all(18.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () async {
                newEnt
                    ? await showDialog(
                        context: context,
                        builder: (context) => CognitiveDistortionAlert(
                                onOptionChange: (bool analyze, value) {
                              analyze ? _cdistort = value : null;
                              setState(() {});
                            }))
                    : null;
                _entry.title = _titlecontroller.text;
                _entry.note = _notecontroller.text;
                _entry.cognitivedistortion = _cdistort;
                newEnt
                    ? await context.read<EntryProvider>().addEntry(_entry)
                    : context.read<EntryProvider>().editEntry(_entry);
                print("id: ${_entry.documentID}\n\n\n\n");
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
        ),
      ),
    );
  }
}
