import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'heading_widget.dart';
import 'label_textField_widget.dart';

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
              const HeadingWidget(title: "Change Password"),
              const Padding(padding: EdgeInsets.all(20)),
              LabelTextWidget(label: "Old Password", widgetController: _oldPassController),
              LabelTextWidget(label: "New Password", widgetController: _newPass1Controller),
              LabelTextWidget(label: "Confirm New Password", widgetController: _newPass2Controller),
              const Padding(padding: EdgeInsets.all(30)),
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
