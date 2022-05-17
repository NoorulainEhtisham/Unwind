import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/google_sign_in_provider.dart';
import 'Sign_up_page.dart';
import 'home_page_master.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;

  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String email;
  late String password;
  String error="";
  bool showError=false;
  @override
  void initState() {
    // // TODO: implement initState
    //   _auth.authStateChanges()
    //     .listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!');
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    labelText: 'User Email',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                InkWell(
                    child: Text("Forgot Password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 13, color: Colors.purpleAccent,),
                    ),
                    onTap: (){

                    },
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
                      child: const Text('Login'),
                      onPressed: () async {
                        print(userEmailController.text);
                        print(passwordController.text);
                        try {
                          UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                              email: userEmailController.text, password: passwordController.text);
                          User? user = userCredential.user;
                          if (user != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomePageMaster(
                                ),
                              ),
                            );
                          }
                        }
                        on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            error='No user found for this email.';
                            setState(() {
                              showError=true;
                            });
                          } else if (e.code == 'wrong-password') {
                            error='Incorrect password. Please try again.';
                            setState(() {
                              showError=true;
                            });
                          }
                        }
                        catch (e) {
                          print(e);
                        }
                      },
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                // StreamBuilder(
                //   stream: FirebaseAuth.instance.authStateChanges(),
                //   builder: (context, snapshot) {
                //     if(snapshot.connectionState==ConnectionState.waiting)
                //       return Center(child: CircularProgressIndicator());
                //     else if (snapshot.hasError){
                //       return Center(child: Text('Something went wrong!'),);
                //     }
                //     else if(snapshot.hasData){
                //       return Text("Snapshot has data");//HomePageMaster(); // if signed in through google then go to homepage instead
                //     }
                //     else{ return Container(
                //       height: 50,
                //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                //       child: ElevatedButton.icon(
                //         style: ElevatedButton.styleFrom(
                //           primary: Color(0xFF90EE90),
                //           minimumSize: Size(double.infinity,50),
                //         ),
                //         icon: FaIcon(FontAwesomeIcons.google, color: Color(0xFF90EE90),),
                //         label: Text("Sign Up with Google"),
                //         onPressed: (){
                //           final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                //           provider.googleLogin();
                //           },
                //       ),
                //     );}
                //   }
                // ),

                StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    else if (snapshot.hasError) {
                      return Center(child: Text('Something went wrong!'),);
                    }
                    else{
                      return Container(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFAE2E0),
                            minimumSize: Size(double.infinity,50),
                          ),
                          icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue,),
                          label: Text("Sign in with Google"),
                          onPressed: (){
                            final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                            provider.googleLogin();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomePageMaster(
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
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
                        style: TextStyle(fontSize: 15, color: Colors.purpleAccent),
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