import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'book.dart';

@immutable
class BooksResponse {

  const BooksResponse({
    required this.books,
  });

  final List<Book> books;

  factory BooksResponse.fromJson(Map<String,dynamic> json) => BooksResponse(
    books: (json['books'] as List? ?? []).map((e) => Book.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'books': books.map((e) => e.toJson()).toList()
  };

  BooksResponse clone() => BooksResponse(
    books: books.map((e) => e.clone()).toList()
  );


  BooksResponse copyWith({
    List<Book>? books
  }) => BooksResponse(
    books: books ?? this.books,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is BooksResponse && books == other.books;

  @override
  int get hashCode => books.hashCode;
}
