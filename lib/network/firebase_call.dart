import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseCall {
  String collectionName;
  late CollectionReference collection;

  FirebaseCall({required this.collectionName}) {
    collection = FirebaseFirestore.instance.collection(collectionName);
  }

  Future<void> getAll() async {
    collection.get().then((QuerySnapshot querySnapshot) =>
        querySnapshot.docs as Map<String, dynamic>)
        .catchError((error)=> {});
  }

  Future<void> getOne(String documentID) async {
    collection
    .doc(documentID)
        .get()
        .then((value) => value as Map<String, dynamic>)
        .catchError((error)=> print("Error: $error"));
  }

  Future<void> add(Map<String, dynamic> doc) async {
    collection
        .add(doc)
        .then((value) {
          String id = value.id;
          print("Object added. ID $id");
          return id;
        })
        .catchError((error) => print("Error: $error"));
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