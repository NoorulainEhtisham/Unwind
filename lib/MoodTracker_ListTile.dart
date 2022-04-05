import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mood_tracker_1.dart';

class MoodTrackerListTile extends StatefulWidget {
  const MoodTrackerListTile({Key? key}) : super(key: key);

  @override
  _MoodTrackerListTileState createState() => _MoodTrackerListTileState();
}

class _MoodTrackerListTileState extends State<MoodTrackerListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF162A49),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 120,
            color: Colors.green,
            child: ListTile(
              title: InkWell(
                child: Text("How are you feeling today?"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          MoodTrackerScreen1(),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 70,
            width: 120,
            color: Colors.green,
            child: ListTile(
              title: Text("Mood History"),
            ),
          ),
        ],
      )
    );
  }
}
