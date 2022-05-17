import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import '../controllers/moods_type_database.dart';
import '../controllers/mood_record_database.dart';
import '../home_page_master.dart';
import '../entities/moods_type.dart';
import '../heading_widget.dart';
import 'package:provider/provider.dart';

class MoodTrackerScreen1 extends StatefulWidget {
  const MoodTrackerScreen1({Key? key}) : super(key: key);

  @override
  _MoodTrackerScreen1State createState() => _MoodTrackerScreen1State();
}

class _MoodTrackerScreen1State extends State<MoodTrackerScreen1> {
  List<MoodsType> _moodsList = [];
  late bool isLoading;

  getData() {
    context.read<MoodsTypeDatabase>().getMoodsType().then((value) {
      _moodsList = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    isLoading = false;
    super.initState();
  }

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
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueGrey,
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: _moodsList.length,
                        itemBuilder: (context, index) => ListTile(
                          tileColor: _moodsList[index].moodColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: _moodsList[index].iconLink,
                          title: Text(_moodsList[index].moodName),
                          onTap: () {
                            MoodRecordDatabase().addMoodRecord(
                                _moodsList[index].moodColor.value,
                                _moodsList[index].moodName,
                                DateTime.now());
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
