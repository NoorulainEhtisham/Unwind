import 'package:flutter/cupertino.dart';
import 'package:unwind_project/entities/tracklist.dart';
import 'package:unwind_project/models/track_model.dart';
import 'package:unwind_project/models/tracklist_model.dart';
import 'package:unwind_project/network/firebase_call.dart';

import '../entities/tracks.dart';
import '../models/model_abstract.dart';

class PlayListProvider extends ChangeNotifier {
  final String _subCollection = "tracks";
  List<TrackList> _tracklist = [];
  late final Model _model;
  final FirebaseCall _firebaseCall = FirebaseCall(collectionName: 'music');

  Future<String> addMusic(TrackList trackList) async {
    String id = "";
    Model model = TrackListModel(
        tracks: trackList.tracks
            ?.map((e) => TrackModel(
                    name: e.name,
                    artistName: e.artistName,
                    duration: e.duration.inSeconds,
                    url: e.url,
                    credits: e.credits)
                .toJson())
            .toList(),
        category: trackList.category);
    id = await _firebaseCall.add(model.toJson());
    trackList.setDocumentID(id);
    notifyListeners();
    return id;
  }

  Future<List<TrackList>> getMusic() async {
    List<TrackListModel> _tracklists = [];
    await _firebaseCall.getAll().then((List value) => _tracklists = value
        .map((e) =>
            TrackListModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
    final trck = _tracklists
        .map((e) => TrackList(
              category: e.category,
              tracks: e.tracks
                  ?.map((e) => Track(
                      name: e['name'],
                      artistName: e['artistName'],
                      duration: Duration(seconds: e['duration']),
                      url: e['path'],
                      credits: e['credits']))
                  .toList(),
            ))
        .toList();
    _tracklist = trck;
    return _tracklist;
  }

  Future<String> addTrack(String documentID, Track track) async {
    int index = _tracklist.indexWhere((element) => element.id == documentID);
    String id = "";
    Model model = TrackModel(
      name: track.name,
      artistName: track.artistName,
      duration: track.duration.inSeconds,
      credits: track.credits,
      url: track.url,
    );

    id = await _firebaseCall.addSubCollection(
        documentID, _subCollection, model.toJson());
    track.setID(id);
    notifyListeners();
    return id;
  }
}
