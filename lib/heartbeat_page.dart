import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //for vibrations
import 'dart:io'; //for sleep

class HeartbeatScreen extends StatefulWidget {
  const HeartbeatScreen({Key? key}) : super(key: key);

  @override
  State<HeartbeatScreen> createState() => _HeartbeatScreenState();
}

class _HeartbeatScreenState extends State<HeartbeatScreen> {
  Timer? timer;
  bool stopTimer = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) => _heartBeats(timer));
  }

  _heartBeats(Timer timer) {


    HapticFeedback.lightImpact();
    sleep(const Duration(milliseconds: 200));
    HapticFeedback.lightImpact();
    sleep(const Duration(milliseconds: 500));
    HapticFeedback.lightImpact();
    sleep(const Duration(milliseconds: 200));
    HapticFeedback.lightImpact();
    sleep(const Duration(milliseconds: 500));

    if (stopTimer) {
      timer.cancel();
      stopTimer = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Take deep breaths and Focus on the touch sensation to ground yourself."),
            ),
            ElevatedButton(
              child: Text('Start'),
              onPressed: () {
                startTimer();
              },
            ),
            Icon(
              Icons.favorite,
              color: Color(0xFFFCDBF8),
              size: 300,
            ),
            ElevatedButton(
              child: Text('Stop'),
              onPressed: () {
                stopTimer = true;
              },
            ),
          ],
        ));
  }
}
