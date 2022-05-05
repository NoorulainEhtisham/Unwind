import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/google_sign_in_provider.dart';
import 'package:unwind_project/controllers/users_provider.dart';
import 'package:unwind_project/user_google_account_info.dart';
import 'Sign_up_page.dart';
import 'entities/user_1.dart';
import 'home_page_master.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    context.read<UsersProvider>().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
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
                      labelText: 'Password',
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
                      child: const Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePageMaster(
                            ),
                          ),
                        );
                      },
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    else if (snapshot.hasError){
                      return Center(child: Text('Something went wrong!'),);
                    }
                    else if(snapshot.hasData){
                      return UserGoogleAccountInfo();//HomePageMaster(); // if signed in through google then go to homepage instead
                    }
                    else{ return Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF90EE90),
                          minimumSize: Size(double.infinity,50),
                        ),
                        icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue,),
                        label: Text("Sign Up with Google"),
                        onPressed: (){
                          final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                          provider.googleLogin();
                          },
                      ),
                    );}
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(
                              //pass var profile as parameter to HomePage
                            ),
                          ),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )
        )
    );
  }
}
