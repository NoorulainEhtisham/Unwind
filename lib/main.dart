import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/deepBreathing1.dart';
import 'package:unwind_project/durationList.dart';
import 'package:unwind_project/entry.dart';
import 'package:unwind_project/logIn.dart';
import 'package:unwind_project/mydiary.dart';
import 'package:unwind_project/signUp.dart';
import 'launch.dart';
import 'mood_tracker_1.dart';
import 'mood_tracker_2.dart';
import 'favourites.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Entries(),
    child: const MyApp(),
  ));
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
      home: DeepBreathingScreen()
    );
  }
}
