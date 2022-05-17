

import 'tracks.dart';
import '../models/model_abstract.dart';

class TrackList{
  String id = "";
  String category;
  List<Track>? tracks = [];


  setDocumentID(String docID) => id = docID;

  TrackList({this.id="", this.tracks, required this.category});

}
