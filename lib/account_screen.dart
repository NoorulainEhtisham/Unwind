import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<String> account_options = ["Account detail", "Change password", "Manage notifications", "Logout"];
  List<IconData> icons = [Icons.person, Icons.lock, Icons.volume_off, Icons.logout];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: ListView.builder(itemCount: account_options.length,
              itemBuilder: (context, index) => ListTile(
              title: Text(account_options[index]),
                trailing: Icon(icons[index]),
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
