import 'package:flutter/cupertino.dart';


class Exercise {
  String title;
  String category;
  String path;
  String script;
  Duration duration;

  Exercise(
      {required this.title,
      required this.category,
      required this.path,
      required this.script,
      required this.duration});
}

class Exercises extends ChangeNotifier {
  List<Exercise> exercises = [
    Exercise(
        title: 'Body Scan Meditation',
        category: 'Body Scan',
        path: 'https://www.uclahealth.org/marc/mpeg/Body-Scan-Meditation.mp3',
        script: 'assets/scripts/BodyScanMeditation_Transcript-3-UCLA.pdf',
        duration: const Duration(minutes: 2, seconds: 44)),
    Exercise(
        title: 'Body Scan for Sleep',
        category: 'Sleep',
        path: 'https://www.uclahealth.org/marc/mpeg/Body-Scan-for-Sleep.mp3',
        script: 'assets/scripts/BodyScanForSleep_Transcript-15-UCLA.pdf',
        duration: Duration(minutes: 13, seconds: 50)),
    Exercise(
        title: 'Complete Meditation Instructions',
        category: 'Simple',
        path: 'https://www.uclahealth.org/marc/mpeg/03_Complete_Meditation_Instructions.mp3',
        script: 'assets/scripts/CompleteMeditation_Transcript.pdf',
        duration: Duration(minutes: 19, seconds: 03)),
    Exercise(
        title: 'Breath, Sound, Body Meditation',
        category: 'Mindfulness',
        path: 'https://www.uclahealth.org/marc/mpeg/02_Breath_Sound_Body_Meditation.mp3',
        script: 'assets/scripts/BreathSoundBody_Transcript.pdf',
        duration: Duration(minutes: 12, seconds: 00)),
    Exercise(
        title: 'The Practice of Vipassana (Mindfulness)',
        category: 'Mindfulness',
        path: 'http://traffic.libsyn.com/tarabrach/1-01-Vipassana-Mindfulness-Meditation-TaraBrach.mp3',
        script: 'assets/scripts/Vipassana-Mindfulness-Meditation-RA-CD-TaraBrach.pdf',
        duration: Duration(minutes: 15, seconds: 27)),
    Exercise(
        title: 'Walking Meditation Instructions',
        category: 'Walking',
        path: 'http://traffic.libsyn.com/tarabrach/2013-12-28-0903AM-Walking-Meditation-Instructions-TaraBrach.mp3',
        script: 'assets/scripts/Walking-Meditation-Instructions.pdf',
        duration: Duration(minutes: 6, seconds: 19)),
    Exercise(
        title: 'Soles of the Feet',
        category: 'Grounding',
        path: 'https://self-compassion.org/wp-content/uploads/2021/07/Soles-Of-The-Feet-Kristin-Neff-Self-Compassion.mp3',
        script: 'assets/scripts/Walking-Meditation-Instructions.pdf',
        duration: Duration(minutes: 13, seconds: 50)),
  ];

  List<Exercise> get exerciseList => exercises;

}
