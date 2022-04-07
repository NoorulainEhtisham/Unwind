import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mood_tracker_1.dart';
import 'mood_tracker_2.dart';

class MoodTrackerListTile extends StatefulWidget {
  const MoodTrackerListTile({Key? key}) : super(key: key);

  @override
  _MoodTrackerListTileState createState() => _MoodTrackerListTileState();
}

class _MoodTrackerListTileState extends State<MoodTrackerListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green,
                Colors.greenAccent,
              ],
            ),
        ),
     // color: Color(0xFF162A49),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 120,
            color: Color.fromRGBO(143, 211, 174, 100),
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
            color: Color.fromRGBO(143, 211, 174, 100),
            child: ListTile(
              title: InkWell(
                  child: Text("Mood History"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MoodTrackerScreen2(),
                      ),
                    );
                  },
              ),
            ),
          ),
        ],
      )
    );
  }
}
