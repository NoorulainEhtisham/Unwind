import 'package:flutter/cupertino.dart';
import 'package:unwind_project/network/firebase_call.dart';
import '../entities/quote.dart';
import '../models/quote_model.dart';

class QuotesProvider extends ChangeNotifier{

  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'quotes');
  List<Quote> _quotes = [];

  List<Quote> get quotes => _quotes; //getter

  Future<List<Quote>> getAllQuotes() async {
    List<QuoteModel> quotesList = [];
    await firebaseCall.getAll().then((List value) => quotesList = value
        .map((e) => QuoteModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());

    final quotes = quotesList
        .map((e) => Quote(
      id: e.id,
      quote: e.quote,
    ))
        .toList();
    _quotes = quotes;
    notifyListeners();
    return _quotes;
  }
}