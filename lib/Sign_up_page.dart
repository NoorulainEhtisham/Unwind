import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unwind_project/entities/user.dart';
import 'package:unwind_project/services/user_getIt.dart';
import 'package:unwind_project/user_specific_data.dart';
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
  TextEditingController password2Controller = TextEditingController();
  bool showError = false;
  String error="";

  @override
  void initState() {
    // TODO: implement initState
    setup();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 250,
                child: SvgPicture.asset('assets/Unwind-Logo.svg'),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: userEmailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter email',
                ),
              ),
              SizedBox(height:10),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Choose a password',
                ),
              ),
              SizedBox(height:10),
              TextField(
                obscureText: true,
                controller: password2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if(showError) ...[
                Text('$error',
                  style: TextStyle(
                    color: Colors.red,
                  ),)
              ],
              Container(
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Sign up'),
                    onPressed: () async {
                    if(passwordController.text==password2Controller.text) {
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                              email: userEmailController.text, password: passwordController.text);
                        if (newUser != null) {
                          //create a new document for the user with the uid
                          await DatabaseService(uid: newUser.user!.uid).updateuserData("FavList", "Diary"); //dummy user properties
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                              ),
                            ),
                          );
                        }
                      }
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          error='The password provided is too weak.';
                          setState(() {
                            showError=true;
                          });
                        } else if (e.code == 'email-already-in-use') {
                          error='The account already exists for that email.';
                          setState(() {
                            showError=true;
                          });
                        }
                      } catch (e) {
                        print(e);
                        error='Please retry.';
                        setState(() {
                          showError=true;
                        });
                      }
                    }
                    else{
                      error='Password mismatch.';
                      setState(() {
                        showError = true;
                      });
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