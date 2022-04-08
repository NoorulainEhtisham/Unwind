import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PageManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late VideoPlayerController _controller;

  String path;
  //= 'https://www.chosic.com/wp-content/uploads/2021/07/Rain-Sound-and-Rainforest.mp3';
      //'assets/audios/Body-Scan-Meditation-3-UCLA.mp3';

  PageManager({required this.path}) {
    _init();
  }


  void _init() async {
    _controller = await VideoPlayerController.network(
      path,
      //'assets/audios/Body-Scan-Meditation-3-UCLA.mp3'
    )
      ..initialize().then((value) => print(_controller.value));
    _controller.addListener(() {
      final isPlaying = _controller.value.isPlaying;
      //final processingState = playerState.processingState;
      if (_controller.value.isBuffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (_controller.value.position != _controller.value.duration) {
        buttonNotifier.value = ButtonState.playing;
      } else { // completed
        _controller.seekTo(Duration.zero);
        _controller.pause();
      }
    });

    _controller.addListener(() {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: _controller.value.position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _controller.addListener(() {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: _controller.value.position,
        total: oldState.total,
      );
    });

   _controller.addListener(() {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: _controller.value.duration, //?? Duration.zero,
      );
    });

  }

  void play() {
    _controller.play();
  }

  void pause() {
    _controller.pause();
  }

  void seek(Duration position) {
    _controller.seekTo(position);
  }

  void dispose() async {
    await _controller.dispose();
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
