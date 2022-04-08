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
    return Container(
        decoration: BoxDecoration(
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
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              width: 120,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('/images/Journal2.jpg'),
                    fit: BoxFit.cover),
              ),
              //color: Color.fromRGBO(144, 188, 224, 100),
              child: ListTile(
                title: InkWell(
                    child: Text("My Diary"),
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
              height: 70,
              width: 120,
              //color: Color.fromRGBO(144, 188, 224, 100),
              decoration:  BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('/images/Journal.jpg'),
                    fit: BoxFit.cover),
              ),
              child: ListTile(
                title: InkWell(
                    child: Text("Add an entry"),
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
