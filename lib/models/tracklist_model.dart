import 'package:unwind_project/models/model_abstract.dart';
import 'package:unwind_project/models/track_model.dart';

class TrackListModel implements Model {
  final String id;
  final String category;
  List? tracks = [];

  TrackListModel({
    this.tracks,
    this.id = "",
    required this.category,
  });

  static TrackListModel fromJson(Map<String, dynamic> json, String documentID) {
    TrackListModel _temp =
        TrackListModel(
            id: documentID,
            tracks: json['tracks'],
          category: json['category']
        );
    return _temp;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['category'] = category;
    json['tracks'] = tracks;
    return json;
  }
}
