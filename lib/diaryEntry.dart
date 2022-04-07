import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/cognitive_distortion_alert.dart';
import 'package:unwind_project/cognitive_distortions.dart';
import 'package:unwind_project/durationList.dart';
import 'entry.dart';

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
  TextEditingController _notecontroller = TextEditingController();
  TextEditingController _titlecontroller = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.entry != null) {
      _entry = widget.entry!;
      _notecontroller.text = widget.entry!.note;
      _titlecontroller.text = widget.entry!.title;
      newEnt = false;
    } else {
      _entry = Entry(
        title: 'Title',
        date: DateTime.now(),
        note: '',
      );
      _titlecontroller.text = _entry.title;
      newEnt = true;
    }
    //_cdistort = _cd[0];
    setState(() {});
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
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                  child: (!_entry.cognitivedistortion.notApplied())
                      ? ListTile(
                          title: Text(_entry.cognitivedistortion.type),
                          subtitle: Text(_entry.cognitivedistortion.example),
                          dense: true,
                        )
                      : const Text('No Cognitive Distortions detected')),
            ],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.info),
            ),
            tooltip: 'Show Cognitive Distortion',
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: TextField(
              // _entry.title,
              controller: _titlecontroller,
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none
              ),
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
                bool cbt = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: CognitiveDistortionAlert(
                            onOptionChange: (value) {
                              _cdistort = value;
                              setState(() {

                              });
                            },
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text("Don't Analyze")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text('Continue')),
                          ],
                        )
                    );
                _entry.title = _titlecontroller.text;
                _entry.note = _notecontroller.text;
                newEnt
                    ? context.read<Entries>().AddEntry(_entry)
                    : context.read<Entries>().EditEntry(_entry);
                context
                    .read<Entries>()
                    .setCognitiveDistortion(_entry, _cdistort);
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
