import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/playlist_provider.dart';
import 'package:video_player/video_player.dart';

import 'audio_player.dart';
import 'controllers/audio_manager.dart';
import 'entities/tracklist.dart';
import 'entities/tracks.dart';

class TrackView extends StatefulWidget {
  final TrackList track;
  TrackView({Key? key, required this.track}) : super(key: key);

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  late List<Track> _tracks;
  Track nowPlaying = Track(name: '', artistName: '', duration: Duration());
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tracks = widget.track.tracks!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
          thickness: 1.8,
          //color: Colors.white,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _tracks.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  minLeadingWidth: 20,
                  title: Text(
                    _tracks[index].name,
                    style: const TextStyle(),
                  ),
                  subtitle: Text(_tracks[index].artistName),
                  leading: Text('${index + 1}'),
                  trailing: Text(
                      '${_tracks[index].duration.inMinutes}:${(_tracks[index].duration.inSeconds.remainder(60))}'),
                  onTap: () async {
                    //isPlaying = true;
                    setState(() {
                      nowPlaying = _tracks[index];
                    });
                    await showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              backgroundColor: const Color.fromRGBO(197, 217, 252, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  content:
                                  AudioPlayerBox(
                                    title: nowPlaying.name,
                                    isPlaylist: true,
                                    audioManager: AudioManager(
                                      path: "https://www.chosic.com/wp-content/uploads/2022/01/Missing-You.mp3",)
                                  ),

                            )
                    );
                  },
                )),
      ],
    );
  }
}
