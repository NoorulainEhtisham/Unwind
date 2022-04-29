import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/providers/audio_manager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:video_player/video_player.dart';

class AudioPlayerBox extends StatefulWidget {
  Color color;
  final bool isPlaylist;
  AudioManager audioManager;
  String title;
  AudioPlayerBox(
      {Key? key,
      required this.title,
      required this.isPlaylist,
      required this.audioManager,
      this.color = Colors.white})
      : super(key: key);

  @override
  State<AudioPlayerBox> createState() => _AudioPlayerBoxState();
}

class _AudioPlayerBoxState extends State<AudioPlayerBox> {
  late final AudioManager _audioManager;
  Size screenSize = Size(0, 0);
  bool isFavourite = false;
  late bool onPlaylistPage;

  @override
  void initState() {
    super.initState();
    _audioManager = widget.audioManager;
    onPlaylistPage = widget.isPlaylist;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    print("\n\nNow playing");
    return Container(
      color: widget.color,
      height: screenSize.height * 0.25,
      width: screenSize.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.music_note),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _audioManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                    progress: value.current,
                    buffered: value.buffered,
                    total: value.total,
                    progressBarColor: Colors.indigo,
                    baseBarColor: Colors.grey.withOpacity(0.24),
                    bufferedBarColor: Colors.white.withOpacity(0.24),
                    thumbColor: Colors.grey[500],
                    barHeight: 4,
                    thumbRadius: 5.0,
                    onSeek: _audioManager.seek);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _audioManager.rewind,
                    iconSize: screenSize.width * 0.05,
                    icon: Icon(Icons.fast_rewind)),
                ValueListenableBuilder<ButtonState>(
                  valueListenable: _audioManager.buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: screenSize.width * 0.05,
                          height: screenSize.width * 0.05,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return IconButton(
                          icon: const Icon(Icons.play_arrow),
                          iconSize: screenSize.width * 0.05,
                          onPressed: _audioManager.play,
                        );
                      case ButtonState.playing:
                        return IconButton(
                          icon: const Icon(Icons.pause),
                          iconSize: screenSize.width * 0.05,
                          onPressed: _audioManager.pause,
                        );
                    }
                  },
                ),
                IconButton(
                    onPressed: _audioManager.fastForward,
                    iconSize: screenSize.width * 0.05,
                    icon: const Icon(Icons.fast_forward)),
                if (widget.isPlaylist)
                  IconButton(
                      color: Colors.pink,
                      iconSize: screenSize.width * 0.05,
                      onPressed: () {
                        isFavourite = !isFavourite;
                        setState(() {});
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
    _audioManager.dispose();
    super.dispose();
  }
}
