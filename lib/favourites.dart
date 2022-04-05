import 'package:flutter/material.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<String> favItems = ["Rain 5", "Deep Breathing", "Simple"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(8)),
            const Text(
              "Favorites",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(61, 90, 128, 100),
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Expanded(child: ListView.builder(itemCount: favItems.length,itemBuilder: (context, index) => ListTile(
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
            ),),)

          ],
        ),
      ),
    );
  }
}
