import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  int time = -1;
  int ind = -1;
  List<String> categories = [
    'Deep Breathing',
    'Mindfulness',
    'Simple',
    'Body Scan',
    'Sleep',
    'Grounding',
    'Walking',
  ];
  List<Exercise> _exercises = [];
  List<Exercise> _selectedCategoryExercises = [];
  List<int> _selectedCategoryDurations = [];
  late Exercise _exercise;
  @override
  Widget build(BuildContext context) {
    _exercises = context.watch<Exercises>().exercises;
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
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: 120,
              color: Colors.pinkAccent,
              child: ListTile(
                title: InkWell(
                  child: Text(categories[index].toString()),
                  onTap: () async {
                    if (categories[index].compareTo("Deep Breathing") != 0) {
                      _selectedCategoryExercises.clear();
                      _selectedCategoryDurations.clear();
                      getRelevantCategory(categories[index]);
                      //print(_selectedCategoryDurations);
                      await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: DurationDialog(
                                  onRadioSelection: (value) {
                                    begin = true;
                                    setState(() {
                                      time = value;
                                    });
                                    // print(value);
                                  },
                                  Durations: _selectedCategoryDurations,
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
                                          if (_selectedCategoryExercises
                                              .isNotEmpty) {
                                            ind = getRelevantExercise(time);
                                            setState(() {
                                             // print("index = $ind");
                                            });
                                          }
                                          ind != -1
                                              ? Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ExerciseScreen(
                                                    exercise:
                                                        _selectedCategoryExercises[
                                                            ind], //navigate to meditation Exercises page here
                                                  ),
                                                ))
                                              : null; //Navigator.of(context).pop();
                                        }
                                      },
                                      child: const Text('Begin')),
                                ],
                              ));
                    }
                  },
                ),
              ),
            );
          }),
    );
  }

  void getRelevantCategory(String category) {
    int duration = 0;
    for (var value in _exercises) {
      duration = ((value.duration.inSeconds) / 60)
          .ceil(); //2:44 minutes round up to 3:00 minutes
      //print(duration);
      if (value.category.toLowerCase().compareTo(category.toLowerCase()) == 0) {
        setState(() {
          _selectedCategoryExercises.add(value);
          _selectedCategoryDurations.add(duration);
        });
      }
    }
  }

  int getRelevantExercise(int duration) {
    int index = _selectedCategoryExercises.indexWhere((element) => ((element.duration.inSeconds) / 60)
        .ceil() == duration);
    return index;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
