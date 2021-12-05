import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class AuthRequest {

  const AuthRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory AuthRequest.fromJson(Map<String,dynamic> json) => AuthRequest(
    username: json['username'] as String,
    password: json['password'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password
  };

  AuthRequest clone() => AuthRequest(
    username: username,
    password: password
  );


  AuthRequest copyWith({
    String? username,
    String? password
  }) => AuthRequest(
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AuthRequest && username == other.username && password == other.password;

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
