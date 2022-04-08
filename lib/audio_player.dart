import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/page_manager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:video_player/video_player.dart';

class AudioPlayer extends StatefulWidget {
  final bool isPlaylist;
  PageManager pageManager;
  String title;
  AudioPlayer({Key? key,required this.title, required this.isPlaylist, required this.pageManager})
      : super(key: key);

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  // AudioPlayer audioPlayer = AudioPlayer();
  // PlayerState playerState = PlayerState.PAUSED;
  // AudioCache audioCache = AudioCache();
  late final PageManager _pageManager;
  bool isFavourite = false;
  late bool onPlaylistPage;


  @override
  void initState() {
    super.initState();
    _pageManager = widget.pageManager;
    onPlaylistPage = widget.isPlaylist;
  }

  @override
  Widget build(BuildContext context) {

    print("\n\nNow playing ${widget.pageManager.path}");
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.music_note),
                Text(widget.title),
              ],
            ),
            const Spacer(),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                    progress: value.current,
                    buffered: value.buffered,
                    total: value.total,
                    onSeek : _pageManager.seek
                );
                    // onSeek: (Duration) {
                    //   _pageManager.seek(Duration);
                    //   setState(() {});
                    // });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isPlaylist)
                  IconButton(
                      onPressed: () {},
                      iconSize: 32.0,
                      icon: Icon(Icons.skip_previous)),
                ValueListenableBuilder<ButtonState>(
                  valueListenable: _pageManager.buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 32.0,
                          height: 32.0,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return IconButton(
                          icon: const Icon(Icons.play_arrow),
                          iconSize: 32.0,
                          onPressed: _pageManager.play,
                        );
                      case ButtonState.playing:
                        return IconButton(
                          icon: const Icon(Icons.pause),
                          iconSize: 32.0,
                          onPressed: _pageManager.pause,
                        );
                    }
                  },
                ),
                if (widget.isPlaylist)
                  IconButton(
                      onPressed: () {},
                      iconSize: 32.0,
                      icon: Icon(Icons.skip_next)),
                if (widget.isPlaylist)
                  IconButton(
                      color: Colors.pinkAccent,
                      iconSize: 32.0,
                      onPressed: () {
                        isFavourite = !isFavourite;
                            setState(() {

                            });
                      },
                      icon: Icon(isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageManager.dispose();
  }
}
