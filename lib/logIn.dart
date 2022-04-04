import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                child: SvgPicture.asset('assets/Unwind-Logo.svg'),
              ),
              TextField(
                controller: _controllerEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const Padding(padding: EdgeInsets.all(12)),
              TextField(
                controller: _controllerPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.width*0.095,
                child: ElevatedButton(
                  child: const Text('Log In'),
                  onPressed: (){
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const Divider(thickness: 3,
              color: Colors.black,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.width*0.095,
                child: ElevatedButton(
                  child: Row(
                    children: const <Widget>[
                      //Icon(Icons.),
                      Text("Sign Up with Google"),
                    ],
                  ),
                  onPressed: (){
                  },
                ),
              ),
              const Text("Don't have an account? Sign up"),
            ],
          ),
        ),
      ),
    );
  }
}
