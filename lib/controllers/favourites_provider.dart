import 'package:flutter/material.dart';
import 'package:unwind_project/entities/favourites.dart';
import 'package:unwind_project/models/favourites_model.dart';
import '../models/moods_type_model.dart';
import '../network/firebase_call.dart';

class FavouritesProvider extends ChangeNotifier{

  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'favourites');

  List<Favourites> _favList = [];

  Future<void> addFavItem(String title, String path, String id, int iconCode, String fontFamily) async{
    final favTemp = FavouritesModel(title: title, path: path, id: id, iconCode: iconCode, fontFamily: fontFamily);
    firebaseCall.add(favTemp.toJson()).then((value){
      print("Value : $value");
    });
    notifyListeners();
  }

  Future<List<Favourites>> getFavItems() async{
    List<FavouritesModel> _favData = [];
    await firebaseCall.getAll().then((List value) => _favData = value
        .map((e) => FavouritesModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());

    final fav = _favData.map((e) => Favourites(title: e.title, path: e.path, id: e.id, icon: Icon(IconData(e.iconCode, fontFamily: e.fontFamily)))).toList();
    _favList = fav;
    return _favList;
  }
}