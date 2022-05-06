import 'package:flutter/material.dart';
import 'package:unwind_project/user_google_account_info.dart';
import 'heading_widget.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  bool isEditable = false;
  final TextEditingController _nameController = TextEditingController(text: "Unwind");
  final TextEditingController _emailController = TextEditingController(text: "unwind@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(8)),
                UserGoogleAccountInfo(),
                isEditable == false ?
                IconButton(
                    onPressed: () {
                      isEditable = true;
                      setState(() {

                      });
                    },
                    icon: const Icon(Icons.edit)) : Container(),
                const Padding(padding: EdgeInsets.all(50)),
                const Text("Name", style: TextStyle(fontSize: 20),),
                const Padding(padding: EdgeInsets.all(7)),
                isEditable == false
                    ? Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height : MediaQuery.of(context).size.height*0.06,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_nameController.text))
                    : TextField(
                        controller: _nameController,
                      ),
                const Padding(padding: EdgeInsets.all(25)),
                const Text("Email", style: TextStyle(fontSize: 20),),
                const Padding(padding: EdgeInsets.all(7)),
                isEditable == false
                    ?  Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height : MediaQuery.of(context).size.height*0.06,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3,),
                      borderRadius: BorderRadius.circular(10),
                  ),
                      child: Text(_emailController.text))
                    : TextField(
                        controller: _emailController,
                      ),
                const Padding(padding: EdgeInsets.all(50)),
                isEditable == true
                    ? Center(
                      child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  height : MediaQuery.of(context).size.height*0.06,
                        child: ElevatedButton(
                            onPressed: () {
                              isEditable = false;
                              setState(() {});
                            },
                            child: const Text("Save")),
                      ),
                    )
                    : Container(),                                      //null
              ],
            ),
          ),
        ),
    );
  }
}
