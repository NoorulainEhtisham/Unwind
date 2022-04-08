import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'home_page_master.dart';
import 'moods_type.dart';
import 'database.dart';
import 'heading_widget.dart';

class MoodTrackerScreen1 extends StatefulWidget {
  const MoodTrackerScreen1({Key? key}) : super(key: key);

  @override
  _MoodTrackerScreen1State createState() => _MoodTrackerScreen1State();
}

class _MoodTrackerScreen1State extends State<MoodTrackerScreen1> {
  List<MoodsType> moodsList = [
    MoodsType(
        moodName: "Happy",
        iconLink: const Icon(UniconsLine.smile),
        moodColor: const Color.fromRGBO(255, 255, 143, 100)),
    MoodsType(
        moodName: "Surprised",
        iconLink: const Icon(UniconsLine.surprise),
        moodColor: const Color.fromRGBO(141, 121, 156, 100)),
    MoodsType(
      moodName: "Bad",
      iconLink: const Icon(UniconsLine.image_block),
      moodColor: const Color.fromRGBO(143, 211, 174, 100),
    ),
    MoodsType(
      moodName: "Fearful",
      iconLink: const Icon(UniconsLine.image_block),
      moodColor: const Color.fromRGBO(254, 223, 144, 100),
    ),
    MoodsType(
      moodName: "Angry",
      iconLink: const Icon(UniconsLine.angry),
      moodColor: const Color.fromRGBO(254, 141, 143, 100),
    ),
    MoodsType(
      moodName: "Disgusted",
      iconLink: const Icon(UniconsLine.image_block),
      moodColor: const Color.fromRGBO(144, 143, 143, 100),
    ),
    MoodsType(
      moodName: "Sad",
      iconLink: const Icon(UniconsLine.sad),
      moodColor: const Color.fromRGBO(144, 188, 224, 100),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingWidget(title: "How are you feeling today?"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  itemCount: moodsList.length,
                  itemBuilder: (context, index) => ListTile(
                    tileColor: moodsList[index].moodColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: moodsList[index].iconLink,
                    title: Text(moodsList[index].moodName),
                    onTap: () {
                      Database().addMoodRecord(moodsList[index].moodName,
                          DateTime.now(), moodsList[index].moodColor);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePageMaster(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
