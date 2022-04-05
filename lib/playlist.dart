import 'package:flutter/material.dart';
import 'package:unwind_project/tracks.dart';
import 'package:unwind_project/trackview.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  final List<TrackList> _tracklist = [
    TrackList([
      Track(name: 'Rain Track 1', artistName: 'Artist 1', duration: Duration(minutes: 10, seconds: 0)),
      Track(name: 'Rain Track 2', artistName: 'Artist 2', duration: Duration(minutes: 10, seconds: 0)),
      Track(name: 'Rain Track 3', artistName: 'Artist 3', duration: Duration(minutes: 10, seconds: 0)),
    ], category: 'Rain'),
    TrackList([
      Track(name: 'Forest Track 1', artistName: 'Artist 1', duration: Duration(minutes: 10, seconds: 0)),
      Track(name: 'Forest Track 2', artistName: 'Artist 2', duration: Duration(minutes: 10, seconds: 0)),
      Track(name: 'Forest Track 3', artistName: 'Artist 3', duration: Duration(minutes: 10, seconds: 0)),
    ], category: 'Forest'),
    TrackList([
      Track(name: 'Sleep Track 1', artistName: 'Artist 1', duration: Duration(minutes: 10, seconds: 0)),
      Track(name: 'Sleep Track 2', artistName: 'Artist 2', duration: Duration(minutes: 10, seconds: 0)),
      Track(name: 'Sleep Track 3', artistName: 'Artist 3', duration: Duration(minutes: 10, seconds: 0)),
    ], category: 'Sleep'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 1c
        foregroundColor: Colors.white,
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'RELAXATION PLAYLIST',
              // _entry.title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          //const Text('\n'),
          Expanded(
            child: Card(
              color: Colors.blueGrey[700],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (var temp in _tracklist)
                      TrackView(track: temp)
                  ],
          ),
              ),
            ),
             )

        ],
      ),
    );
  }
}