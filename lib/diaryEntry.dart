import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'entry.dart';

class DiaryEntry extends StatefulWidget {
  final Entry? entry;
  const DiaryEntry({Key? key, this.entry}) : super(key: key);

  @override
  State<DiaryEntry> createState() => _DiaryEntryState();
}

class _DiaryEntryState extends State<DiaryEntry> {
  late Entry _entry;
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
    } else {
      _entry = Entry(
        title: 'Title',
        date: DateTime.now(),
        note: '',
      );
      _titlecontroller.text = _entry.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 1c
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              // _entry.title,
              controller: _titlecontroller,
              style: Theme.of(context).textTheme.headline2,
              decoration: const InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.MMMMEEEEd().format(_entry.date),
                  style: Theme.of(context).textTheme.headline4,
                  //textAlign: TextAlign.left,
                ),
              ],
            ),
            const Text('\n'),
            Expanded(
              //color: Colors.grey,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: _notecontroller,
                decoration:
                    const InputDecoration(fillColor: Colors.white, filled: true
                        // backgroundColor: Colors.white
                        ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width:double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _entry.title = _titlecontroller.text;
              _entry.note = _notecontroller.text;
              context.read<Entries>().AddEntry(_entry);
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
            )
          ),
        ),
      ),
    );
  }
}
