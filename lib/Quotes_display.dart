import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotesDisplay extends StatelessWidget {
  const QuotesDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFF1D1FC),
              Color(0xFFC9F1FF),
              Color(0xFFC5D9FC),
            ],
          ),
        ),
        //color: Color(0xFF162A49),
        height: screenSize.height*0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: screenSize.height*0.2,
              width: screenSize.width*0.8,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('assets/images/Seaside.jpg'),
                    fit: BoxFit.cover),
              ),
              //color: Colors.pinkAccent,
              child: ListTile(
                //read quotes here
                title: Center(child: Text("The only journey is the journey within.")),
              ),
            ),
          ],
        )
    );
  }
}
