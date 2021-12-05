import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'book.dart';

@immutable
class BookResponse {

  const BookResponse({
    required this.book,
  });

  final Book book;

  factory BookResponse.fromJson(Map<String,dynamic> json) => BookResponse(
    book: Book.fromJson(json['book'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'book': book.toJson()
  };

  BookResponse clone() => BookResponse(
    book: book.clone()
  );


  BookResponse copyWith({
    Book? book
  }) => BookResponse(
    book: book ?? this.book,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is BookResponse && book == other.book;

  @override
  int get hashCode => book.hashCode;
}
