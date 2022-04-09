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
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFBEA5C7),
                Color(0xFFFCDBF8),
              ],
            ),
        ),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 120,
            // color: Color.fromRGBO(143, 211, 174, 100),
            decoration:  BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage('/images/mood.jpg'),
                  fit: BoxFit.cover),
            ),
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
            decoration:  BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage('/images/Calender.jpg'),
                  fit: BoxFit.cover),
            ),
            //color: Color.fromRGBO(143, 211, 174, 100),
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
