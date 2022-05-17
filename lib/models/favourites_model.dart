import 'package:flutter/cupertino.dart';

class FavouritesModel {
  String title;
  String collection;
  String id;
  int iconCode;
  String fontFamily;

  FavouritesModel({
    required this.title,
    required this.collection,
    required this.id,
    required this.iconCode,
    required this.fontFamily,
  });

  Map<String, dynamic> toJson() {
    //admin use
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['collection'] = collection;
    data['id'] = id;
    data['iconCode'] = iconCode;
    data['fontFamily'] = fontFamily;

    return data;
  }

  static FavouritesModel fromJson(Map<String, dynamic> json) => FavouritesModel(
      title: json['title'],
      collection: json['collection'],
      id: json['id'],
      iconCode: json['iconCode'],
      fontFamily: json['fontFamily']);

}
