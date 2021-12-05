import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class User {

  const User({
    required this.id,
    required this.username,
    required this.token,
  });

  final String id;
  final String username;
  final String token;

  factory User.fromJson(Map<String,dynamic> json) => User(
    id: json['id'] as String,
    username: json['username'] as String,
    token: json['token'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'token': token
  };

  User clone() => User(
    id: id,
    username: username,
    token: token
  );


  User copyWith({
    String? id,
    String? username,
    String? token
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    token: token ?? this.token,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is User && id == other.id && username == other.username && token == other.token;

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ token.hashCode;
}
