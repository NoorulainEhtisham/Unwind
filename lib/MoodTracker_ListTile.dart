import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/mood_tracker_1.dart';
import 'views/mood_tracker_2.dart';

class MoodTrackerListTile extends StatefulWidget {
  const MoodTrackerListTile({Key? key}) : super(key: key);

  @override
  _MoodTrackerListTileState createState() => _MoodTrackerListTileState();
}

class _MoodTrackerListTileState extends State<MoodTrackerListTile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
        height: screenSize.height*0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: screenSize.height*0.2,
            width: screenSize.width*0.4,
            decoration:  BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                  image: AssetImage('assets/images/mood.jpg'),
                  fit: BoxFit.cover),
            ),
            child: ListTile(
              title: InkWell(
                child: Center(child: Text("How are you feeling today?")),
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
            height: screenSize.height*0.2,
            width: screenSize.width*0.4,
            decoration:  BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                  image: AssetImage('assets/images/Calender.jpg'),
                  fit: BoxFit.cover),
            ),
            //color: Color.fromRGBO(143, 211, 174, 100),
            child: ListTile(
              title: InkWell(
                  child: Center(child: Text("Mood History")),
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
