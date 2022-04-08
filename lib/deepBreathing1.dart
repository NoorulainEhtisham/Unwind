import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unwind_project/deep_breathing.dart';

import 'DeepBreathingAnimation.dart';

class DeepBreathingScreen1 extends StatefulWidget {
  const DeepBreathingScreen1({Key? key}) : super(key: key);

  @override
  State<DeepBreathingScreen1> createState() => _DeepBreathingScreen1State();
}

class _DeepBreathingScreen1State extends State<DeepBreathingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Breathe in slowly through your nose for 5 seconds."),
            Text("Hold your breath for 5 seconds"),
            Text("Breathe out through your mouth for 5 seconds."),
            Counter(), //timer 1 to 5
            Container(
                height: 150,
                child: BreathAnimation()
            ),
            ElevatedButton(
              child: const Text("Stop"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                    const DeepBreathingPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  Timer? timer;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        setState(() {
          if (count<5){
            count++;
          }else{
            count=1;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$count', style: Theme.of(context).textTheme.headline4);
  }
}