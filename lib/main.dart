import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/favourites_provider.dart';
import 'package:unwind_project/controllers/mood_record_database.dart';
import 'package:unwind_project/controllers/playlist_provider.dart';
import 'package:unwind_project/controllers/google_sign_in_provider.dart';
import 'controllers/entry_provider.dart';
import 'controllers/exercises_provider.dart';
import 'controllers/quotes_provider.dart';
import 'package:unwind_project/controllers/moods_type_database.dart';
import 'package:unwind_project/home_page_master.dart';
import 'package:unwind_project/views/mood_tracker_1.dart';
import 'launch.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MoodsTypeDatabase()),
      ChangeNotifierProvider(create: (_) => EntryProvider()),
      ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ChangeNotifierProvider(create: (_) => PlayListProvider()),
      ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ChangeNotifierProvider(create: (_) => QuotesProvider()),
      ChangeNotifierProvider(create: (_) => MoodRecordDatabase()),
      ChangeNotifierProvider(create: (_) => FavouritesProvider()),
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
      home: const LaunchScreen(),
      routes: {
        "mood tracker 1": (_) => const MoodTrackerScreen1(),
        "home page master": (_) => const HomePageMaster(),
        "home": (_) => const MoodTrackerScreen1(),
      },
    );
  }
}


