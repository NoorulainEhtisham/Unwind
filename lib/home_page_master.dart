import 'package:flutter/material.dart';
import 'package:unwind_project/account_screen.dart';
import 'package:unwind_project/playlist.dart';
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
    Playlist(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size; //get screen size to allow flexibility in browser
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Welcome User!"),
      ),
      body: Center(child: _items[_currentIndex],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
       onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
       },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.lightBlue ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: 'Playlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
        //selectedItemColor: Colors.blue,
      )
    );
  }
}
