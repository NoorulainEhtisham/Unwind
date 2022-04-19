import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'diaryEntry.dart';
import 'mydiary.dart';

class JournalingListTile extends StatefulWidget {
  const JournalingListTile({Key? key}) : super(key: key);

  @override
  _JournalingListTileState createState() => _JournalingListTileState();
}

class _JournalingListTileState extends State<JournalingListTile> {
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
              Color(0xFFFCDBF8),
              Color(0xFFE8FAFF),
              Color(0xFFC9F1FF),
            ],
          ),
        ),
        //color: const Color(0xFF162A49),
        height: screenSize.height*0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: screenSize.height*0.2,
              width: screenSize.width*0.4,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('assets/images/Journal2.jpg'),
                    fit: BoxFit.cover),
              ),
              child: ListTile(
                title: InkWell(
                    child: Center(child: Text("My Diary")),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const Diary(), //navigate to meditation Exercises page here
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: screenSize.height*0.2,
              width: screenSize.width*0.4,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('assets/images/Journal.jpg'),
                    fit: BoxFit.cover),
              ),
              child: ListTile(
                title: InkWell(
                    child: Center(child: Text("Add an entry")),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                          const DiaryEntry(), //navigate to meditation Exercises page here
                        ),
                      );
                    },
                ),
              ),
            ),
          ],
        )
    );;
  }
}
