import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'user.dart';

@immutable
class AuthResponse {

  const AuthResponse({
    required this.user,
  });

  final User user;

  factory AuthResponse.fromJson(Map<String,dynamic> json) => AuthResponse(
    user: User.fromJson(json['user'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'user': user.toJson()
  };

  AuthResponse clone() => AuthResponse(
    user: user.clone()
  );


  AuthResponse copyWith({
    User? user
  }) => AuthResponse(
    user: user ?? this.user,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AuthResponse && user == other.user;

  @override
  int get hashCode => user.hashCode;
}
