import 'package:flutter/cupertino.dart';
import 'package:unwind_project/models/exercise_model.dart';
import 'package:unwind_project/network/firebase_call.dart';


import '../entities/exercises.dart';
import '../models/model_abstract.dart';

class ExerciseProvider extends ChangeNotifier {

  FirebaseCall _firebaseCall = FirebaseCall(collectionName: 'exercises');
  late Model _model;

  List<Exercise> _exercises = [];

  Future<List<Exercise>> getExercises() async {
    List<ExerciseModel> exList = [];
    await _firebaseCall.getAll().then(
            (List value) => exList = value.map(
                    (e) => ExerciseModel.fromJson(e.data() as Map<String, dynamic>, e.id)
            ).toList()
    );
    final exer = exList.map((e) =>
        Exercise(
          id: e.id,
            title: e.title,
            category: e.category,
            path: e.path,
            script: e.script,
            duration: Duration(seconds: e.seconds)
        )
    ).toList();
    _exercises = exer;
    return _exercises;
  }

  Future<String> addExercise(Exercise exercise) async {
    String id = "";
    _model = ExerciseModel(
        title: exercise.title,
        category: exercise.category,
        path: exercise.path,
        script: exercise.script,
        seconds: exercise.duration.inSeconds
    );
    id = await _firebaseCall.add(_model.toJson());
    notifyListeners();
    return id;
  }



}
