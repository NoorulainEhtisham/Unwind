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
              Colors.green,
              Colors.blue,
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
              color: Color.fromRGBO(144, 188, 224, 100),
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
              color: Color.fromRGBO(144, 188, 224, 100),
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
