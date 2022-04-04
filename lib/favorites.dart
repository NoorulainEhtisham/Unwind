import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favItems = ["Rain 5", "Deep Breathing", "Simple"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: favItems.length,itemBuilder: (context, index) => ListTile(
        title: Text(favItems[index]),
        trailing: IconButton(
          icon: const Icon(Icons.favorite,
          color: Colors.red,),
          onPressed: (){
            favItems.removeAt(index);
            setState(() {

            });
          },
        ),
      )),
    );
  }
}
