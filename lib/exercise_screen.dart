import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:unwind_project/audio_player.dart';
import 'package:video_player/video_player.dart';

import 'controllers/audio_manager.dart';
import 'entities/exercises.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  const ExerciseScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  String script = "";
  bool isLoading = true;
  Size screenSize = Size(0, 0);
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
    PdfDocument document = PdfDocument(
        inputBytes: await _readDocumentData(_exercise.script),);

//Create a new instance of the PdfTextExtractor.
    PdfTextExtractor extractor = PdfTextExtractor(document);

//Extract all the text from the document.
    script = extractor.extractText();
    isLoading = false;
    setState(() {});
    document.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          _exercise.title,
          softWrap: false,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: screenSize.width*0.04,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(61, 90, 128, 100),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
          // isLoading
          //     ? const CircularProgressIndicator()
          //     :
          Padding(
                padding: const EdgeInsets.only(bottom: 500),
                child: Text(
                    script,
                    textScaleFactor: 2,
                    textAlign: TextAlign.center,
                  ),
              ),
        ),
      ),
      floatingActionButton: AudioPlayerBox(
        title: _exercise.title,
        audioManager: AudioManager(controller: VideoPlayerController.network(_exercise.path)),
        isPlaylist: false,
      ),
    );
  }
}

Future<List<int>> _readDocumentData(String name) async {
  final ByteData data = await rootBundle.load(name);
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}