import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/deepBreathing1.dart';
import 'package:unwind_project/home_page.dart';
import 'package:unwind_project/home_page_master.dart';

class DeepBreathingPage extends StatefulWidget {
  const DeepBreathingPage({Key? key}) : super(key: key);

  @override
  _DeepBreathingPageState createState() => _DeepBreathingPageState();
}

class _DeepBreathingPageState extends State<DeepBreathingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deep Breathing"),
        automaticallyImplyLeading: false,
        leading: IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
              const HomePageMaster(), //navigate to meditation Exercises page here
            ),
          );
        }),
      ),
      body: Center(
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration:  BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                  image: AssetImage('assets/images/Feather.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Place one hand on your belly and the other on your chest." ,style: TextStyle(fontSize: 18),),
              Text("Breathe in, hold, and exhale according to the timer." ,style: TextStyle(fontSize: 18),),
              Text("Focus on your lungs expanding and contracting." ,style: TextStyle(fontSize: 18),),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                    const DeepBreathingScreen1(), //navigate to meditation Exercises page here
                  ),
                );
              },
                  child: Text("Start"))
            ],
          ),
        ),
      ),
    );
  }
}