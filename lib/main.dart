import 'package:flutter/material.dart';
import 'launch.dart';
import 'mood_tracker_1.dart';
import 'mood_tracker_2.dart';
import 'favourites.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MoodTrackerScreen2(),
    );
  }
}

