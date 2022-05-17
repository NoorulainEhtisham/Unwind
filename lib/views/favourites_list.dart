import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/favourites_database.dart';
import 'package:unwind_project/entities/favourites.dart';
import '../heading_widget.dart';

class FavouritesListScreen extends StatefulWidget {
  const FavouritesListScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesListScreen> createState() => _FavouritesListScreenState();
}

class _FavouritesListScreenState extends State<FavouritesListScreen> {
  late List<Favourites> _favList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavouritesDatabase().getMoodsType();
    _favList = [];
  }

  @override
  Widget build(BuildContext context) {

    _favList = context.watch<FavouritesDatabase>().record;

    return Scaffold(
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeadingWidget(title: "Favorites"),
              Expanded(
                child: ListView.builder(
                  itemCount: _favList.length,
                  itemBuilder: (context, index)
                    {
                      return Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black, width: 0.1),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.transparent,
                        elevation: 0,
                        child:  ListTile(
                          title: Text(_favList[index].title),
                          trailing: IconButton(
                            icon: _favList[index].icon,
                            onPressed: () {
                              _favList.removeAt(index);
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
