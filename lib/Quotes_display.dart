import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotesDisplay extends StatelessWidget {
  const QuotesDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF162A49),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              width: 400,
              color: Colors.orange,
              child: ListTile(
                //read quotes here
                title: Text("The only journey is the journey within."),
              ),
            ),
          ],
        )
    );
  }
}
