class User {
  String _id = "";
  final String userEmail;
  final String userName;
  final String password;

  User({
   id,
    required this.userEmail,
    required this.userName,
    required this.password,
  }){
    this._id = id;
  }

}
