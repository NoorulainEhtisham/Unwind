

class Exercise {
  String id;
  String title;
  String category;
  String path;
  String script;
  Duration duration;

  Exercise(
      {this.id = "",
        required this.title,
      required this.category,
      required this.path,
      required this.script,
      required this.duration});
}

