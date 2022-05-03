import 'package:flutter/cupertino.dart';
import 'package:unwind_project/network/firebase_call.dart';
import '../entities/user.dart';
import '../models/user_model.dart';

class UsersProvider extends ChangeNotifier{

  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'users');
  List<User> _users = [];

  Future<List<User>> getAllUsers() async {
    List<UserModel> usersList = [];
    await firebaseCall.getAll().then((List value) => usersList = value
        .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());

    final users = usersList
        .map((e) => User(
        id: e.id,
        userEmail: e.userEmail,
        userName: e.userName,
        password: e.password,
        ))
        .toList();
    print('users API response: ${users}');
    _users = users;

    return _users;
  }
}