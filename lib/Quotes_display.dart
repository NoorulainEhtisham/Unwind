import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/quotes_provider.dart';
import 'dart:math';

import 'entities/quote.dart';

class QuotesDisplay extends StatefulWidget {
  const QuotesDisplay({Key? key}) : super(key: key);

  @override
  State<QuotesDisplay> createState() => _QuotesDisplayState();
}

class _QuotesDisplayState extends State<QuotesDisplay> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFF1D1FC),
              Color(0xFFC9F1FF),
              Color(0xFFC5D9FC),
            ],
          ),
        ),
        height: screenSize.height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: screenSize.height * 0.2,
              width: screenSize.width * 0.8,
              child: ListTile(
                //read quotes here
                title: currQuote(),
              ),
            ),
          ],
        ));
  }
}

class currQuote extends StatefulWidget {
  const currQuote({Key? key}) : super(key: key);
  @override
  State<currQuote> createState() => _currQuoteState();
}

class _currQuoteState extends State<currQuote> {
  List<Quote> _quotesList =[];
  late bool isLoading=true;

  Future<List<Quote>> getQList() async {
    await context.read<QuotesProvider>().getAllQuotes().then((value) {
      _quotesList = value;
      setState(() {});
      isLoading = false;
       print("QUOTEELISTT $_quotesList");
    });
    return _quotesList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQList();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {

      Random random = new Random();
      if(_quotesList.length!=0){
        int randomNumber = random.nextInt(_quotesList.length);
        String quote = _quotesList[randomNumber].quote.toString();
        return Center(
          child: Container(child: Text(quote,style: TextStyle(fontStyle: FontStyle. italic),)),
        );
      }
      else{
        return Text("loading...");
      }

    }
}
