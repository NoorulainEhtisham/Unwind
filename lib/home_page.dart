import 'package:flutter/material.dart';
import 'Journaling_ListTile.dart';
import 'MeditationExercises_ListTile.dart';
import 'MoodTracker_ListTile.dart';
import 'Quotes_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( //Use List Tile instead
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Mood Tracker"),
          const MoodTrackerListTile(),
          const Text("Meditation Exercises"),
          const MeditationExercisesListTile(),
          const Text("Journaling"),
          const JournalingListTile(),
          const Text("Quotes"),
          const QuotesDisplay(),
        ],
      ),
    );
  }
}
