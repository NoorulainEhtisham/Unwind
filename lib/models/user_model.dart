//API returns model
class UserModel {
  String id = "";
  final String userEmail; //email is unique, username is not
  final String userName;
  final String password;

  UserModel({
    docID="",
    required this.userEmail,
    required this.userName,
    required this.password,
  }){
    this.id = docID;
  }


  static UserModel fromJson(Map<String, dynamic> json, String documentID) {
    return UserModel(
      docID:documentID,
      userEmail: json['userEmail'],
      userName: json['userName'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userEmail'] = userEmail;
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }


}
