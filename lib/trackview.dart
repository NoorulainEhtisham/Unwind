import 'dart:html';

import 'package:flutter/material.dart';
import 'package:unwind_project/tracks.dart';

class TrackView extends StatefulWidget {
  final TrackList track;
  const TrackView({Key? key, required this.track}) : super(key: key);

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  late List<Track> _tracks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tracks = widget.track.tracks;
    //print(_tracks.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.track.category,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.left,
        ),
        const Divider(
          thickness: 2,
          color: Colors.white,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _tracks.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(_tracks[index].name),
                  subtitle: Text(_tracks[index].artistName),
                  leading: Text('${index + 1}'),
                  trailing: Text('${_tracks[index].duration.inMinutes}'),
                ))
      ],
    );
  }
}
