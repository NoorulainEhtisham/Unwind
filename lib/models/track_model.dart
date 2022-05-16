import 'package:unwind_project/models/model_abstract.dart';

class TrackModel implements Model {
  final String id;
  final String name;
  final String artistName;
  final int duration;
  String credits = "";
  String url = "";

  TrackModel({
    required this.name,
    required this.artistName,
    required this.duration,
    this.id = "",
    this.credits = "",
    this.url = "",
  });

  static TrackModel fromJson(Map<String, dynamic> json, String documentID) {
    return TrackModel(
      name: json['name'],
      artistName: json['artistName'],
      duration: json['duration'],
      credits: json['credits'],
      url: json['path'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['artistName'] = artistName;
    json['duration'] = duration;
    json['credits'] = credits;
    json['path'] = url;

    return json;
  }
}
