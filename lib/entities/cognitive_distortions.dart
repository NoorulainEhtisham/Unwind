class CgnDistort {
  String type;
  String example;

  CgnDistort({required this.type, required this.example});

  bool notApplied() =>
      type.compareTo('') == 0 && example.compareTo('') == 0;
}
