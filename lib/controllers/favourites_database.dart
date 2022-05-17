import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unwind_project/entities/favourites.dart';
import 'package:unwind_project/models/favourites_model.dart';

class FavouritesDatabase extends ChangeNotifier{

  static final List<FavouritesModel> _favouritesListData = [];
  static final List<Favourites> _favouritesList = [];

  List<Favourites> get record => _favouritesList;

  Future<void> addFavourite(String title, String collection, String id, int iconCode, String fontFamily) async{
    CollectionReference favourites = FirebaseFirestore.instance.collection("favourite");
    final favouriteTemp = FavouritesModel(title: title, collection: collection, id: id, iconCode: iconCode, fontFamily: fontFamily);
    favourites
        .add(favouriteTemp.toJson())
        .catchError((error) => print("Failed to add use: $error"));
    notifyListeners();
  }

  Future<void> getMoodsType() async{
    FirebaseFirestore.instance.collection('moodsType').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _favouritesListData.add(FavouritesModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
    var fav = _favouritesListData.map((e) => Favourites(title: e.title, collection: e.collection, id: e.id, icon: Icon(IconData(e.iconCode, fontFamily: e.fontFamily))));
    _favouritesList.addAll(fav);
  }

  //update that item in firebase

  Future<void> deleteFavourite(FavouritesModel fav) async{
    CollectionReference favourites = FirebaseFirestore.instance.collection("favourite");
    favourites
        .doc(fav.collection)
        .delete()
        .catchError((error) => print("Failed to add use: $error"));
    notifyListeners();
  }
}