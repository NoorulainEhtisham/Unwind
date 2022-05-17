import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/durationList.dart';
import 'package:unwind_project/heartbeat_page.dart';

import 'controllers/exercises_provider.dart';
import 'deep_breathing.dart';
import 'entities/exercises.dart';
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
    'Heartbeat',
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
    Size screenSize = MediaQuery.of(context).size;
    context.watch<ExerciseProvider>().getExercises().then((value) {
      _exercises = value;
      // setState(() {
      //
      // });

    });
    return SizedBox(
        height: 140,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFBEA5C7),
                      Color(0xFFFCDBF8),
                      Color(0xFFE8FAFF),
                    ],
                  ),
                ),
                //color: Color(0xFF162A49),
                height: 120,
                width: 20,
              );
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                  height: screenSize.height*0.2,
                  width: screenSize.width*0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.green.withOpacity(0.3), BlendMode.dstATop),
                        image: AssetImage('assets/images/Feather.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    height: screenSize.height*0.2,
                    width: screenSize.width*0.5,
                    child: ListTile(
                      title: InkWell(
                        child:
                            Center(child: Text(categories[index].toString())),
                        onTap: () async {
                          if (index>1) {
                            _selectedCategoryExercises.clear();
                            _selectedCategoryDurations.clear();
                            getRelevantCategory(categories[index]);
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
                                                minimumSize: const Size(
                                                    double.infinity, 50),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30))),
                                            onPressed: () {
                                              if (begin) {
                                                if (_selectedCategoryExercises
                                                    .isNotEmpty) {
                                                  ind =
                                                      getRelevantExercise(time);
                                                  setState(() {
                                                    // print("index = $ind");
                                                  });
                                                }
                                                if(ind!=-1) {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        ExerciseScreen(
                                                          exercise:
                                                          _selectedCategoryExercises[
                                                          ind], //navigate to meditation Exercises page here
                                                        ),
                                                  ));
                                                }
                                              }
                                            },
                                            child: const Text('Begin')),
                                      ],
                                    ));
                          } else if(index==0) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DeepBreathingPage()));
                          }
                          else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HeartbeatScreen()));
                          }
                        },
                      ),
                    ),
                  ));
            }));
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
    int index = _selectedCategoryExercises.indexWhere(
        (element) => ((element.duration.inSeconds) / 60).ceil() == duration);
    return index;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
