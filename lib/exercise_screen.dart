import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(8)),
            const Text(
              "Exercise",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(61, 90, 128, 100),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
