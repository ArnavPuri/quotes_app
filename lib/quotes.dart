import 'dart:convert';

import 'package:flutter/services.dart';

class Quote {
  String text;
  String author;
  String category;

  Quote(this.text, this.author, this.category);
}

class QuoteHelper {
  Future<List<Quote>> createQuotes() async {
    String fileText = await rootBundle.loadString('assets/quotes.txt');
    List quotesMap = jsonDecode(fileText);
    List<Quote> result = [];
    quotesMap.forEach((quoteJSON) => result.add(
        Quote(quoteJSON['Quote'], quoteJSON['Author'], quoteJSON['Category'])));
    return result;
  }
}
