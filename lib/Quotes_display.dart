import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unwind_project/entities/quote.dart';
import 'controllers/quotes_provider.dart';

class QuotesDisplay extends StatefulWidget {
  const QuotesDisplay({Key? key}) : super(key: key);

  @override
  State<QuotesDisplay> createState() => _QuotesDisplayState();
}

class _QuotesDisplayState extends State<QuotesDisplay> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<QuotesProvider>().getAllQuotes();
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
        height: screenSize.height*0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: screenSize.height*0.2,
              width: screenSize.width*0.8,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('assets/images/Seaside.jpg'),
                    fit: BoxFit.cover),
              ),
              child: ListTile(
                //read quotes here
                title: currQuote(),
              ),
            ),
          ],
        )
    );
  }
}





class currQuote extends StatefulWidget {
  const currQuote({Key? key}) : super(key: key);
  @override
  State<currQuote> createState() => _currQuoteState();
}

class _currQuoteState extends State<currQuote> {
  @override
  Widget build(BuildContext context) {

    final quotes_list = Provider.of<QuotesProvider>(context).quotes;
    return Center(
      child: Container(
        child: Text( quotes_list[0].quote.toString() ),
      ),
    );
  }
}
