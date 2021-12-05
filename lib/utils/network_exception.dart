class NetworkException implements Exception {
  NetworkException({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;
}
