import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes_app/quotes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuotesPage(),
  ));
}

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  Color defaultColor = Colors.blue;
  String quoteText = 'Live life king size';
  String author = 'Arnav Puri';
  String category = 'Life';
  List<Quote> quotes = [];
  QuoteHelper helper = QuoteHelper();
  String bgUrl = 'https://source.unsplash.com/random/800x600';
  List<Color> colors = Colors.primaries;


  @override
  void initState() {
    helper.createQuotes().then((data) {
      setState(() {
        quotes = data;
        updateQuote();
      });
    });
    super.initState();
  }

  updateQuote() {
    int randomIndex = Random().nextInt(quotes.length);
    Quote currentQuote = quotes[randomIndex];
    setState(() {
      author = currentQuote.author.split(',')[0];
      quoteText = currentQuote.text;
      category = currentQuote.category;
      defaultColor = colors[Random().nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                quoteText,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Vollkorn',
                ),
              ),
              Container(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    author,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    height: 1,
                    width: 10,
                    color: Colors.black,
                  )
                ],
              ),
              Text(
                category,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              Container(
                height: 40,
              ),
              FloatingActionButton(
                child: Icon(Icons.arrow_forward, size: 20,),
                onPressed: updateQuote,
                backgroundColor: defaultColor,
                heroTag: 'Arnav',
                mini: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
