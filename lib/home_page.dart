import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Text("Welcome User!",style: Theme.of(context).textTheme.headlineSmall),
          QuotesDisplay(),
          SizedBox(
            height: 30,
          ),
          Text("Mood Tracker",style: Theme.of(context).textTheme.headlineSmall),
          MoodTrackerListTile(),
          SizedBox(
            height: 30,
          ),
          Text("Meditation Exercises",style: Theme.of(context).textTheme.headlineSmall),
          MeditationExercisesListTile(),
          SizedBox(
            height: 30,
          ),
          Text("Journaling",style: Theme.of(context).textTheme.headlineSmall),
          JournalingListTile(),
        ],
      ),
    );
  }
}
