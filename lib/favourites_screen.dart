import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/controllers/favourites_provider.dart';
import 'package:unwind_project/entities/favourites.dart';
import 'heading_widget.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Favourites> favItems = [];
  late bool isLoading;

  getData() {
    context.read<FavouritesProvider>().getFavItems().then((value) {
      favItems = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const HeadingWidget(title: "Favorites"),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueGrey,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: favItems.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black, width: 0.1),
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            leading: favItems[index].icon,
                            title: Text(favItems[index].title),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                favItems.removeAt(index);
                                setState(() {});
                                //FavouritesProvider().deleteItem(favItems[index].id, favItems[index].path);    //user id & collection name
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
