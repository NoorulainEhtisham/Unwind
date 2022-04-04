import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class MoodTrackerScreen1 extends StatefulWidget {
  const MoodTrackerScreen1({Key? key}) : super(key: key);

  @override
  _MoodTrackerScreen1State createState() => _MoodTrackerScreen1State();
}

class _MoodTrackerScreen1State extends State<MoodTrackerScreen1> {
  List<Moods> moodsList = [
    Moods(moodName: "Happy", iconLink: const Icon(UniconsLine.smile), moodColor: const Color.fromRGBO(255, 255, 143, 100)),
    Moods(moodName: "Surprised", iconLink: const Icon(UniconsLine.surprise), moodColor: const Color.fromRGBO(141, 121, 156, 100)),
    Moods(moodName: "Bad", iconLink: const Icon(UniconsLine.image_block), moodColor: const Color.fromRGBO(143, 211, 174, 100),),
    Moods(moodName: "Fearful", iconLink: const Icon(UniconsLine.image_block), moodColor: const Color.fromRGBO(254, 223, 144, 100),),
    Moods(moodName: "Angry", iconLink: const Icon(UniconsLine.angry), moodColor: const Color.fromRGBO(254, 141, 143, 100),),
    Moods(moodName: "Disgusted", iconLink: const Icon(UniconsLine.image_block), moodColor: const Color.fromRGBO(144, 143, 143, 100),),
    Moods(moodName: "Sad", iconLink: const Icon(UniconsLine.sad), moodColor: const Color.fromRGBO(144, 188, 224, 100),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(8)),
            const Text(
              "How are your feeling today?",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(61, 90, 128, 100),
              ),
            ),
          const Padding(padding: EdgeInsets.all(12)),
            Expanded(
                child: ListView.builder(
                    itemCount: moodsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: moodsList[index].moodColor,
                        margin: const EdgeInsets.all(2),
                        child: ListTile(
                          leading: moodsList[index].iconLink,
                          title: Text(moodsList[index].moodName),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class Moods {
  String moodName;
  Icon iconLink;
  Color moodColor = Colors.blueGrey;

  Moods({required this.moodName, required this.iconLink, required this.moodColor});
}
