
import '../entities/tracks.dart';

class TrackList{
  String category;
  List<Track> _tracks = [];

  List<Track> get tracks => _tracks;

  TrackList(List<Track> tracks, {required this.category}) {
    this._tracks = tracks;
  }

  void addTrack(Track _track) {
    _tracks.add(_track);
  }
}