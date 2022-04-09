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
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration:  BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                image: AssetImage('/images/Feather.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Instructions_text(),
              Counter(), //timer 1 to 5
              Container(
                  height: 300,
                  //height: MediaQuery.of(context).size.height*0.2,
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
class Instructions_text extends StatefulWidget {
  const Instructions_text({Key? key}) : super(key: key);

  @override
  _Instructions_textState createState() => _Instructions_textState();
}

class _Instructions_textState extends State<Instructions_text> {
  int count = 0;
  List<String> Instructions = [
    "Breathe in slowly through your nose.",
    "Hold your breath for 5 seconds.",
    "Breathe out through your mouth.",
  ];
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 5),
          (timer) {
        setState(() {
          if (count<2){
            count++;
          }else{
            count=0;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text(
              Instructions[count],style: TextStyle(fontSize: 18),
            ),
        ],
      ),
    );
  }
}

