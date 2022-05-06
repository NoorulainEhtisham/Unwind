import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/Login_page.dart';
import 'package:unwind_project/account_details.dart';
import 'package:unwind_project/change_password.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final _auth = FirebaseAuth.instance;

  List<String> account_options = [
    "Account detail",
    "Change password",
    "Manage notifications",
    "Logout"
  ];
  List<IconData> icons = [
    Icons.person,
    Icons.lock,
    Icons.volume_off,
    Icons.logout
  ];
  List<Widget?> pages = [
    AccountDetailsScreen(),
    ChangePassword(),
    null,
    LoginPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: account_options.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(account_options[index]),
                  trailing: Icon(icons[index]),
                  onTap: () {
                    if(account_options[index]=='Logout'){
                      //Implement logout functionality
                      _auth.signOut();
                      Navigator.pop(context);
                    }
                    else if (pages[index] != null &&
                        account_options[index]
                                .compareTo("Manage notifications") !=
                            0) {
                      goToScreen(index);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  goToScreen(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => pages[index] as Widget,
    ));
  }
}
