import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:unwind_project/Login_page.dart';
import 'dart:async';

import 'package:unwind_project/views/mood_tracker_1.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  }


  final List<Color> _colors = [
    const Color(0xffF1D1FC),
    const Color(0xffFCDBF8),
    const Color(0xffE8FAFF),
    const Color(0xffC9F1FF),
    const Color(0xffC5D9FC),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _colors,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/Unwind-Logo.svg'),
              JumpingDotsProgressIndicator(
                fontSize: 70,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
