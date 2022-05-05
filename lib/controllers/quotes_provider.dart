import 'package:flutter/cupertino.dart';
import 'package:unwind_project/network/firebase_call.dart';
import '../entities/quote.dart';
import '../models/quote_model.dart';

class QuotesProvider extends ChangeNotifier{

  FirebaseCall firebaseCall = FirebaseCall(collectionName: 'quotes');
  List<Quote> _quotes = [];

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
    print('quotes API response: ${quotes.first.quote}');

    _quotes = quotes;

    return _quotes;
  }
}