import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/durationList.dart';
import 'package:unwind_project/exercises.dart';

import 'exercise_screen.dart';

class MeditationExercisesListTile extends StatefulWidget {
  const MeditationExercisesListTile({Key? key}) : super(key: key);

  @override
  _MeditationExercisesListTileState createState() =>
      _MeditationExercisesListTileState();
}

class _MeditationExercisesListTileState
    extends State<MeditationExercisesListTile> {
  //read exercises list from db into this array
  bool begin = false;
  List<String> Exercises = [
    'Deep Breathing',
    'Mindfulness',
    'Simple',
    'Body Scan',
    'Sleep',
    'Grounding',
    'Walking',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.purpleAccent,
                    Colors.pinkAccent,
                    Colors.redAccent,
                  ],
                ),
              ),
              //color: Color(0xFF162A49),
              height: 70,
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Exercises.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: 120,
              color: Colors.pinkAccent,
              child: ListTile(
                title: InkWell(
                  child: Text(Exercises[index].toString()),
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              contentPadding: EdgeInsets.all(8),
                              content: DurationDialog(
                                onRadioSelection: (value) {
                                  begin = true;
                                  setState(() {});
                                  // print(value);
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed: () {
                                      if (begin) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExerciseScreen(
                                                  exercise: Exercise(
                                                      title: 'Body Scan Meditation',
                                                      category: Exercises[index],
                                                      path: 'assets/audios/Body-Scan-Meditation-3-UCLA.mp3',
                                                      script: 'scripts/BodyScanMeditation_Transcript-3-UCLA.pdf',
                                                      duration: Duration()
                                                  ),
                                                ), //navigate to meditation Exercises page here
                                          ),
                                        );
                                        //Navigator.of(context).pop();
                                      }
                                    },
                                    child: const Text('Begin')),
                              ],
                            ));
                  },
                ),
              ),
            );
          }),
    );
  }
}
