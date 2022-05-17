import 'package:unwind_project/models/model_abstract.dart';

class ExerciseModel implements Model {
  String id = "";
  String title;
  String category;
  String path;
  String script;
  int seconds;

  ExerciseModel(
      {id = "",
      required this.title,
      required this.category,
      required this.path,
      required this.script,
      required this.seconds}) {
    this.id = id;
  }

  static ExerciseModel fromJson(Map<String, dynamic> json, String documentID) {
    return ExerciseModel(
        id: documentID,
        title: json['title'],
        category: json['category'],
        path: json['path'],
        script: json['script'],
        seconds: json['seconds']);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    Map<String, dynamic> data = {};
    data['title'] = title;
    data['category'] = category;
    data['path'] = path;
    data['script'] = script;
    data['seconds'] = seconds;

    return data;
  }
}
