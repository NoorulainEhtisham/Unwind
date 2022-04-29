

class Track{
  final String name;
  final String artistName;
  final Duration duration;
  String credits = "";
  String URL = "";
  bool favourite = false;

  Track({required this.name, required this.artistName, required this.duration, this.credits = "", this.URL = ""});
}