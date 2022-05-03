import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserGoogleAccountInfo extends StatefulWidget {
  const UserGoogleAccountInfo({Key? key}) : super(key: key);

  @override
  State<UserGoogleAccountInfo> createState() => _UserGoogleAccountInfoState();
}

class _UserGoogleAccountInfoState extends State<UserGoogleAccountInfo> {
  @override
  Widget build(BuildContext context) {
    final usergoogleinfo = FirebaseAuth.instance.currentUser!;
    return Column(
      children: [
        CircleAvatar(
          radius:40,
          backgroundImage: NetworkImage(usergoogleinfo.photoURL!),
        ),
        Text('Name: ' + usergoogleinfo.displayName!,
        style: TextStyle(color:Colors.blue, fontSize: 16),),
        Text('Email: ' + usergoogleinfo.email!,
          style: TextStyle(color:Colors.blue, fontSize: 16),)
      ],
    );
  }
}
