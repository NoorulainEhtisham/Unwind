import 'package:flutter/material.dart';
import 'package:unwind_project/tracks.dart';

class TrackView extends StatefulWidget {
  Function(bool) onSelectingTrack;
  Function(Track) nowPlaying;
  final TrackList track;
  TrackView(
      {Key? key,
      required this.track,
      required this.onSelectingTrack,
      required this.nowPlaying})
      : super(key: key);

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  late List<Track> _tracks;
  bool isPlaying = false;

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
          thickness: 1,
          color: Colors.white,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _tracks.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _tracks[index].name,
                    style: const TextStyle(),
                  ),
                  subtitle: Text(_tracks[index].artistName),
                  leading: Text('${index + 1}'),
                  trailing: Text(
                      '${_tracks[index].duration.inMinutes.remainder(60)}:${(_tracks[index].duration.inSeconds.remainder(60))}'),
                  onTap: () {
                    isPlaying = !isPlaying;
                    widget.onSelectingTrack(isPlaying);
                    widget.nowPlaying(_tracks[index]);
                  },
                ))
      ],
    );
  }
}
