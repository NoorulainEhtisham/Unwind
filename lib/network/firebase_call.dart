import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCall {
  String collectionName;
  late CollectionReference collection;

  FirebaseCall({required this.collectionName}) {
    collection = FirebaseFirestore.instance.collection(collectionName);
  }

  Future<List> getAll() async {
    List data = [];
    await collection.get().then((QuerySnapshot querySnapshot) =>
      data = querySnapshot.docs
    ).catchError((error) => print("Cannot get all data $error"));
    return data;
  }

  Future<Object?> getOne(String documentID) async {
    Object? data = {};
    await collection
        .doc(documentID)
        .get()
        .then((value) {
          data = value.data();
    })
        .catchError((error) => print("Error: $error"));
    // print("Document = ${data}");
    return data;
  }

  Future<String> add(Map<String, dynamic> doc) async {
    String id = "";
    collection.add(doc).then((value) {
      id = value.id;
      print("Object added. ID $id");
    }).catchError((error) => print("Error occured. Cannot add data.: $error"));
    return id;
  }

  Future<void> delete(String documentID) async {
    collection
        .doc(documentID)
        .delete()
        .then((value) => print("Object Deleted"))
        .catchError((error) => print("Failed to delete object: $error"));
  }

  Future<void> edit(String documentID, Map<String, dynamic> newDoc) async {
    collection
        .doc(documentID)
        .update(newDoc)
        .then((value) => print("Object Updated"))
        .catchError((error) => print("Failed to update object: $error"));
  }
}
