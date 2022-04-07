import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/entry.dart';
import 'package:unwind_project/mydiary.dart';
import 'launch.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Entries(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //custom theme color navy blue
  // static Map<int, Color> color = {
  //   50:Color.fromRGBO(4, 131, 184, .1),
  //   100:Color.fromRGBO(4, 131, 184, .2),
  //   200:Color.fromRGBO(4, 131, 184, .3),
  //   300:Color.fromRGBO(4, 131, 184, .4),
  //   400:Color.fromRGBO(4, 131, 184, .5),
  //   500:Color.fromRGBO(4, 131, 184, .6),
  //   600:Color.fromRGBO(4, 131, 184, .7),
  //   700:Color.fromRGBO(4, 131, 184, .8),
  //   800:Color.fromRGBO(4, 131, 184, .9),
  //   900:Color.fromRGBO(4, 131, 184, 1),
  // };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        //primarySwatch: MaterialColor(0xFF162A49, color),
      ),
      home: const LaunchScreen()
    );
  }
}
