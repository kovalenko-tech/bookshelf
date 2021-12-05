import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class ErrorResponse {

  const ErrorResponse({
    required this.message,
  });

  final String message;

  factory ErrorResponse.fromJson(Map<String,dynamic> json) => ErrorResponse(
    message: json['message'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'message': message
  };

  ErrorResponse clone() => ErrorResponse(
    message: message
  );


  ErrorResponse copyWith({
    String? message
  }) => ErrorResponse(
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ErrorResponse && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
