//API returns model
class QuoteModel {
  String id = "";
  final String quote;

  QuoteModel({
    docID="",
    required this.quote,
  }){
    this.id = docID;
  }


  static QuoteModel fromJson(Map<String, dynamic> json, String documentID) {
    return QuoteModel(
      docID:documentID,
      quote: json['quote'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['quote'] = quote;
    return data;
  }


}
