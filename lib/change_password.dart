import 'package:flutter/material.dart';
import 'account_screen.dart';

class ChangePassword extends StatelessWidget {
   ChangePassword({Key? key}) : super(key: key);

  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPass1Controller = TextEditingController();
  final TextEditingController _newPass2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(8)),
                  const Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(61, 90, 128, 100),
                    ),
                  ),
              const Padding(padding: EdgeInsets.all(50)),
              const Text("Old Password", style: TextStyle(fontSize: 20),),
              const Padding(padding: EdgeInsets.all(7)),
              Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height : MediaQuery.of(context).size.height*0.06,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _oldPassController,
                  ),
              ),
              const Padding(padding: EdgeInsets.all(25)),
              const Text("New Password", style: TextStyle(fontSize: 20),),
              const Padding(padding: EdgeInsets.all(7)),
              Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height : MediaQuery.of(context).size.height*0.06,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.3,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                controller: _newPass1Controller),
              ),
              const Text("Confirm New Password", style: TextStyle(fontSize: 20),),
              const Padding(padding: EdgeInsets.all(7)),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height : MediaQuery.of(context).size.height*0.06,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3,),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                    controller: _newPass2Controller),
              ),
              const Padding(padding: EdgeInsets.all(50)),
               Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  height : MediaQuery.of(context).size.height*0.06,
                  child: ElevatedButton(
                      onPressed: () {
                        if(_newPass1Controller == _oldPassController)                           //INSERT CONDITION TO MAKE OLD PASSWORD (DATABASE)
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AccountScreen(),
                              ),
                            );
                          }                                                                   //add else
                      },
                      child: const Text("Save")),
                ),
               ),//null
            ],
          ),
        ),
      ),
    );
  }
}
