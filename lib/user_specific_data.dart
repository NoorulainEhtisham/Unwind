import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference UserSpecificDataCollection=FirebaseFirestore.instance.collection('UserSpecificDataCollection');

  //call this function when the new user signs up
  Future updateuserData (String favs, String diary) async {
    return await UserSpecificDataCollection.doc((uid)).set({
      'favs':favs,
      'diary':diary,
    });
  }
}