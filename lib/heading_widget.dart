import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width/10,
          fontFamily: 'Raleway',
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
