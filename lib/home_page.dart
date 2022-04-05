import 'package:flutter/material.dart';
import 'Journaling_ListTile.dart';
import 'MeditationExercises_ListTile.dart';
import 'MoodTracker_ListTile.dart';
import 'Quotes_display.dart';
import 'mood_tracker_1.dart';
import 'mydiary.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( //Use List Tile instead
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Mood Tracker"),
          InkWell(
            child: MoodTrackerListTile(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                  MoodTrackerScreen1(),
                ),
              );
            },
          ),
          Text("Meditation Exercises"),
          InkWell(
            child: MeditationExercisesListTile(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      MoodTrackerScreen1(), //navigate to meditation Exercises page here
                ),
              );
            },
          ),
          Text("Journaling"),
          InkWell(
            child: JournalingListTile(),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) =>
                    Diary(), //navigate to meditation Exercises page here
                ),
              );
            },
          ),
          Text("Quotes"),
          QuotesDisplay(),
        ],
      ),
    );
  }
}
