import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class Book {
  const Book({
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.id,
    required this.pageCount,
    required this.publisher,
    required this.synopsis,
  });

  final String title;
  final String author;
  final String coverImageUrl;
  final String id;
  final int pageCount;
  final String publisher;
  final String synopsis;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
      title: json['title'].toString(),
      author: json['author'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      id: json['id'] as String,
      pageCount: json['pageCount'] as int,
      publisher: json['publisher'] as String,
      synopsis: json['synopsis'] as String);

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
        'coverImageUrl': coverImageUrl,
        'id': id,
        'pageCount': pageCount,
        'publisher': publisher,
        'synopsis': synopsis
      };

  Book clone() => Book(
      title: title,
      author: author,
      coverImageUrl: coverImageUrl,
      id: id,
      pageCount: pageCount,
      publisher: publisher,
      synopsis: synopsis);

  Book copyWith(
          {String? title,
          String? author,
          String? coverImageUrl,
          String? id,
          int? pageCount,
          String? publisher,
          String? synopsis}) =>
      Book(
        title: title ?? this.title,
        author: author ?? this.author,
        coverImageUrl: coverImageUrl ?? this.coverImageUrl,
        id: id ?? this.id,
        pageCount: pageCount ?? this.pageCount,
        publisher: publisher ?? this.publisher,
        synopsis: synopsis ?? this.synopsis,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          title == other.title &&
          author == other.author &&
          coverImageUrl == other.coverImageUrl &&
          id == other.id &&
          pageCount == other.pageCount &&
          publisher == other.publisher &&
          synopsis == other.synopsis;

  @override
  int get hashCode =>
      title.hashCode ^
      author.hashCode ^
      coverImageUrl.hashCode ^
      id.hashCode ^
      pageCount.hashCode ^
      publisher.hashCode ^
      synopsis.hashCode;
}
