import 'package:flutter/material.dart';
import 'package:unwind_project/audio_player.dart';
import 'package:unwind_project/page_manager.dart';
import 'package:unwind_project/tracks.dart';
import 'package:unwind_project/trackview.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;
  Track nowPlaying = Track(name: '', artistName: '', duration: Duration());
  final List<TrackList> _tracklist = [
    TrackList([
      Track(
          name: 'Rain Sound and Rainforest',
          artistName: 'Sound Effects',
          duration: Duration(minutes: 4, seconds: 0),
          URL:
              'https://www.chosic.com/wp-content/uploads/2021/07/Rain-Sound-and-Rainforest.mp3',
          credits: 'Music: https://www.chosic.com/free-music/all/ '),
      Track(
          name: 'Rain and Thunder',
          artistName: 'Sound Effects',
          duration: Duration(minutes: 0, seconds: 33),
          URL:
              'https://www.chosic.com/wp-content/uploads/2021/07/Rain-and-Thunder.mp3',
          credits: 'Music: https://www.chosic.com/free-music/all/'),
      Track(
          name: 'Fly Away When The Fog Settled Down',
          artistName: 'Spheriá',
          duration: Duration(minutes: 3, seconds: 44),
          URL:
              'https://www.chosic.com/wp-content/uploads/2022/01/Fly-Away-When-The-Fog-Settled-Down.mp3',
          credits:
              ' Fly Away When The Fog Settled Down by Spheriá | https://soundcloud.com/spheriamusic\nMusic promoted by https://www.chosic.com/free-music/all/\nCreative Commons CC BY-SA 3.0\nhttps://creativecommons.org/licenses/by-sa/3.0/'),
    ], category: 'Rain'),
    TrackList([
      Track(
          name: 'Surreal Forest',
          artistName: 'Meydän',
          duration: Duration(minutes: 2, seconds: 2),
          URL:
              'https://www.chosic.com/wp-content/uploads/2022/01/04-Meydan-Surreal-Forest.mp3',
          credits:
              "Surreal Forest by Meydän | https://linktr.ee/meydan\nMusic promoted by https://www.chosic.com/free-music/all/\nCreative Commons CC BY 4.0\nhttps://creativecommons.org/licenses/by/4.0/"),
      Track(
          name: 'Pure sound of the nightingale song in the forest',
          artistName: 'Sound Effects',
          duration: Duration(minutes: 2, seconds: 3),
          URL:
              'https://www.chosic.com/wp-content/uploads/2021/04/smand__nightingale-song.mp3',
          credits: 'Music: https://www.chosic.com/free-music/all/'),
      Track(
        name: 'Jungle night heavy crickets',
        artistName: 'Sound Effects',
        duration: Duration(minutes: 3, seconds: 45),
        URL:
            'https://www.chosic.com/wp-content/uploads/2021/04/kyles__thailand-jungle-night-heavy-crickets1.mp3',
        credits: 'Music: https://www.chosic.com/free-music/all/',
      ),
    ], category: 'Forest'),
    TrackList([
      Track(
        name: 'Spatium',
        artistName: 'Keys of Moon',
        duration: Duration(minutes: 3, seconds: 43),
        URL:
            'https://www.chosic.com/wp-content/uploads/2021/07/Spatium-Calm-Ambient-Music.mp3',
        credits:
            ' Spatium by Keys of Moon | https://soundcloud.com/keysofmoon\nMusic promoted by https://www.chosic.com/free-music/all/\nAttribution 4.0 International (CC BY 4.0)\nhttps://creativecommons.org/licenses/by/4.0/',
      ),
      Track(
        name: 'Jul',
        artistName: 'Scott Buckley',
        duration: Duration(minutes: 3, seconds: 28),
        URL:
            'https://www.chosic.com/wp-content/uploads/2021/08/scott-buckley-jul.mp3',
        credits:
            ' Jul by Scott Buckley | www.scottbuckley.com.au\nMusic promoted by https://www.chosic.com/free-music/all/\nCreative Commons Attribution 4.0 International (CC BY 4.0)\nhttps://creativecommons.org/licenses/by/4.0/',
      ),
      Track(
        name: 'Contemplate the stars',
        artistName: 'Meydän',
        duration: Duration(minutes: 4, seconds: 52),
        URL:
            'https://www.chosic.com/wp-content/uploads/2022/01/09-Meydan-Contemplate-the-stars.mp3',
        credits:
            ' Contemplate the stars by Meydän | https://linktr.ee/meydan\nMusic promoted by https://www.chosic.com/free-music/all/\nCreative Commons CC BY 4.0\nhttps://creativecommons.org/licenses/by/4.0/',
      ),
    ], category: 'Sleep'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //_audioPlayer = AudioPlayer(path: nowPlaying.URL, isPlaylist: true);
    if (nowPlaying != null) print(nowPlaying.URL + "\n\n" + nowPlaying.credits);
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 219, 248, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              color: Color.fromRGBO(241, 209, 252, 1),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (var temp in _tracklist)
                      TrackView(
                        track: temp,
                        onSelectingTrack: (value) {
                          isPlaying = value;
                          setState(() {});
                        },
                        nowPlaying: (_track) {
                          setState(() {
                            nowPlaying = _track;
                          });
                        },
                      )
                  ],
                ),
              ),
            ),
          ),
          if (isPlaying)
            AudioPlayer(
              title: nowPlaying.name,
              pageManager: PageManager(path: nowPlaying.URL), isPlaylist: true,
            ),
        ],
      ),
      //bottomSheet: AudioPlayer(),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
