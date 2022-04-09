import 'package:flutter/material.dart';
import 'heading_widget.dart';

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
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeadingWidget(title: "Favorites"),
              Expanded(
                child: ListView.builder(
                  itemCount: favItems.length,
                  itemBuilder: (context, index)
                    {
                      return Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black, width: 0.1),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.transparent,
                        elevation: 0,
                        child:  ListTile(
                          title: Text(favItems[index]),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              favItems.removeAt(index);
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                ),
              )
            ],
          ),
      ),
    );
  }
}
