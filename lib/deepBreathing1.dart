import 'package:flutter/material.dart';

class DeepBreathingScreen extends StatefulWidget {
  const DeepBreathingScreen({Key? key}) : super(key: key);

  @override
  State<DeepBreathingScreen> createState() => _DeepBreathingScreenState();
}

class _DeepBreathingScreenState extends State<DeepBreathingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(50)),
            const Text('Deep Breathing'),
            const Padding(padding: EdgeInsets.all(120)),
            const Text('Place one hand on your belly and the other on your chest'),
            const Padding(padding: EdgeInsets.all(50)),
            ElevatedButton(child: const Text("Start"),
            onPressed: (){
            },
            ),
          ],
        ),
      ),
    );
  }
}
