import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/playlist_provider.dart';
import 'package:unwind_project/trackview.dart';
import 'package:video_player/video_player.dart';

import 'entities/tracklist.dart';
import 'entities/tracks.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  bool isPlaying = false;
  bool isLoading = true;

  Track nowPlaying = Track(name: '', artistName: '', duration: Duration());
  List<TrackList> _tracklist = [];

  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    context.watch<PlayListProvider>().getMusic().then((value) {
      _tracklist = value;
      setState(() {
        isLoading = false;
      });
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 219, 248, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isLoading
            ? [
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                )
              ]
            : [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'RELAXATION PLAYLIST',
                    // _entry.title,
                    style: TextStyle(fontSize: screenSize.width * 0.05),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: const Color.fromRGBO(241, 209, 252, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          for (var temp in _tracklist)
                            TrackView(
                              track: temp,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tracklist.clear();
    super.dispose();
  }
}
