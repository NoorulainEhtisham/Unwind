import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'deep_breathing.dart';
import 'exercise_screen.dart';

class MeditationExercisesListTile extends StatefulWidget {
  const MeditationExercisesListTile({Key? key}) : super(key: key);

  @override
  _MeditationExercisesListTileState createState() => _MeditationExercisesListTileState();
}

class _MeditationExercisesListTileState extends State<MeditationExercisesListTile> {
  //read exercises list from db into this array
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
      height: 140,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
              height: 70,
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Exercises.length,
          itemBuilder: (context,index) {
            return
              Container(
                height: 120,
                width: 120,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                      image: AssetImage('/images/Feather.jpg'),
                      fit: BoxFit.cover),
                ),
                child: ListTile(
                    title: InkWell(
                        child: Center(child: Text(Exercises[index].toString())),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DeepBreathingPage(), //navigate to meditation Exercises page here
                          ),
                        );
                      },
                    ),
                ),
              );
          }
      ),
    );
  }
}
