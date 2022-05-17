import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/account_screen.dart';
import 'package:unwind_project/playlist.dart';
import 'package:unwind_project/services/local_notification.dart';
// import 'views/favourites_list.dart';
import 'favourites.dart';
import 'home_page.dart';

class HomePageMaster extends StatefulWidget {
  const HomePageMaster({Key? key}) : super(key: key);

  @override
  _HomePageMasterState createState() => _HomePageMasterState();
}

class _HomePageMasterState extends State<HomePageMaster> {
  int _currentIndex = 0;
  List<Widget> _items = [
    //same page, different bodies
    HomePage(),
    FavouritesScreen(),
    //FavouritesListScreen(),
    Playlist(),
    AccountScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotification.initialize(context);

    //terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message){
      if(message != null){                                        //if not terminated
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    FirebaseMessaging.onMessage.listen((message) {                  //foreground
      if(message.notification != null){
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotification.display(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {         //background + user clicks
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size; //get screen size to allow flexibility in browser
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Unwind",style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets. all(15),
            child: _items[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
       onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
       },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Color(0xFF99A9C4) ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: 'Playlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
        //selectedItemColor: Colors.blue,
      )
    );
  }
}
