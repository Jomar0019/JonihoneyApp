import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String bookid;
  final String booktitle;
  final String bookcover;
  final String booksummary;

  BookModel({
    required this.bookid,
    required this.booktitle,
    required this.bookcover,
    required this.booksummary,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookid: json['bookid'] as String,
      booktitle: json['booktitle'] as String,
      bookcover: json['bookcover'] as String,
      booksummary: json['booksummary'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookid': bookid,
      'booktitle': booktitle,
      'bookcover': bookcover,
      'booksummary': booksummary
    };
  }
}
