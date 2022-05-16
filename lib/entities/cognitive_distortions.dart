class CgnDistort {
  String type;
  String example;

  CgnDistort({this.type = '', this.example = ''});

  bool notApplied() =>
      type.compareTo('') == 0 && example.compareTo('') == 0;
}