abstract class NewUser {
  String getUid();
  void setUid(String uid);
}

class NewMember implements NewUser {
  String Uid = "";

  @override
  String getUid() {
    // TODO: implement getUid
    return Uid;
  }

  @override
  void setUid(String uid) {
    // TODO: implement setUid
    this.Uid = uid;
  }
}
