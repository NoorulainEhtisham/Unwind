

class Track {
  String _id = "";

  final String name;
  final String artistName;
  final Duration duration;
  String credits = "";
  String url = "";
  bool favourite = false;

  Track(
      {required this.name,
      required this.artistName,
      required this.duration,
      this.credits = "",
      this.url = ""});

  String get id => _id;

  setID(String value) {
    _id = value;
  }
}
