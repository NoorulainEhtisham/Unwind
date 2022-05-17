import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Reset password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Center(
          child: Column(
            children: [
              Text("Recieve an email to reset your password"),
              TextFormField(
                controller: emailController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Email'),
              //     validator: (email)=>
              //     email != null && !EmailValidator.validate(email)? 'Enter a valid email':null,
              ),
              ElevatedButton(
                  onPressed: (){
                    resetPassword();
                  },
                  child: Text("Reset password")),
            ],
          ),
        ),
      )
    );
  }
  Future resetPassword() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim());
    } on FirebaseAuthException catch(e){
      print(e);
      Navigator.of(context).pop();
    }
  }
}
