import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:unwind_project/audio_player.dart';
import 'package:unwind_project/exercises.dart';
import 'package:unwind_project/page_manager.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  const ExerciseScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  String script = "";
  bool isLoading = true;
  late Exercise _exercise;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exercise = widget.exercise;
    _init();
  }

  _init() async {
    isLoading = true;
    setState(() {});
    //Load an existing PDF document.
    PdfDocument document =
        PdfDocument(inputBytes: await _readDocumentData(_exercise.script));

//Create a new instance of the PdfTextExtractor.
    PdfTextExtractor extractor = PdfTextExtractor(document);

//Extract all the text from the document.
    script = extractor.extractText();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          _exercise.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(61, 90, 128, 100),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: isLoading
              ? const CircularProgressIndicator()
              : Padding(
                padding: const EdgeInsets.only(bottom: 500, top: 10, left: 10, right: 10),
                child: Text(
                    script,
                    textAlign: TextAlign.center,
                    textScaleFactor: 2,
                  ),
              ),
        ),
      ),
      floatingActionButton: AudioPlayer(
        title: _exercise.title,
        pageManager: PageManager(path: _exercise.path),
        isPlaylist: false,
      ),
    );
  }
}

Future<List<int>> _readDocumentData(String name) async {
  final ByteData data = await rootBundle.load(name);
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
