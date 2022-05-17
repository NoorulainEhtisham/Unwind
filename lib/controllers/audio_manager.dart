import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AudioManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late VideoPlayerController controller;

  AudioManager({required String path}) {
    controller = VideoPlayerController.network(path);
    _init();
  }

  void _init() async {
    await controller.initialize().then((value) => print(controller.value));
    controller.addListener(() {
      final isPlaying = controller.value.isPlaying;
      //final processingState = playerState.processingState;
      if (controller.value.isBuffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (controller.value.position != controller.value.duration) {
        buttonNotifier.value = ButtonState.playing;
      } else { // completed
        controller.seekTo(Duration.zero);
        controller.pause();
      }
    });

    controller.addListener(() {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: controller.value.position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    controller.addListener(() {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: controller.value.position,
        total: oldState.total,
      );
    });

   controller.addListener(() {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: controller.value.duration, //?? Duration.zero,
      );
    });
  }

  void play() {
    controller.play();
  }

  void pause() {
    controller.pause();
  }

  void seek(Duration position) {
    controller.seekTo(position);
  }

  void dispose() {
   // _audioHandler.customAction('dispose');
    controller.dispose();
  }

  Future seekPosition(Duration Function(Duration currentPosition) builder) async {
    final currentPosition = await controller.position;
    final newPosition;

    if (currentPosition != null) {
       newPosition = builder(currentPosition);
       await controller.seekTo(newPosition);
    }
  }

  Future fastForward() async {
    seekPosition((currentPosition) => currentPosition + Duration(seconds: 5));
  }

  Future rewind() async {
    seekPosition((currentPosition) => currentPosition - Duration(seconds: 5));
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
