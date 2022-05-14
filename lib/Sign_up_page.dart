import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;

  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 250,
                child: SvgPicture.asset('assets/Unwind-Logo.svg'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: userEmailController,
                  // onChanged: (value){
                  //   email=value;
                  //   //do something with user input
                  //do it for password too
                  // },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Choose a password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Sign up'),
                    onPressed: () async {
                      print(userEmailController.text);
                      print(passwordController.text);
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                              email: userEmailController.text, password: passwordController.text);
                        if (newUser != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  )
              ),
            ],
          )
      )
    );
  }
}