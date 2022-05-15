
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/MeditationExercises_ListTile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:unwind_project/audio_player.dart';
import 'package:unwind_project/entry.dart';
import 'package:unwind_project/exercises.dart';
import 'package:unwind_project/home_page.dart';
import 'package:unwind_project/controllers/moods_type_database.dart';
import 'package:unwind_project/mydiary.dart';
import 'DeepBreathingAnimation.dart';
import 'deep_breathing.dart';
import 'package:unwind_project/playlist.dart';
import 'package:unwind_project/trackview.dart';
import 'launch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Entries()),
      ChangeNotifierProvider(create: (_) => Exercises()),
      ChangeNotifierProvider(create: (_) => MoodsTypeDatabase())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
//  custom theme color navy blue
  static Map<int, Color> color = {
    50:Color.fromRGBO(4, 131, 184, .1),
    100:Color.fromRGBO(4, 131, 184, .2),
    200:Color.fromRGBO(4, 131, 184, .3),
    300:Color.fromRGBO(4, 131, 184, .4),
    400:Color.fromRGBO(4, 131, 184, .5),
    500:Color.fromRGBO(4, 131, 184, .6),
    600:Color.fromRGBO(4, 131, 184, .7),
    700:Color.fromRGBO(4, 131, 184, .8),
    800:Color.fromRGBO(4, 131, 184, .9),
    900:Color.fromRGBO(4, 131, 184, 1),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        //primarySwatch: Colors.lightBlue,
        primarySwatch: MaterialColor(0xFFD7BAE0, color),
      ),
      home: const LaunchScreen()
    );
  }
}


