import 'package:injectable/injectable.dart';

@lazySingleton
class Session {
  String? _accessToken;
  String? _userId;
  String? username;

  String? get accessToken => _accessToken;

  String? get userId => _userId;

  bool get isValidSession => accessToken != null;

  void init({
    String? accessToken,
    String? userId,
    String? username,
  }) {
    _accessToken = accessToken;
    _userId = userId;
    this.username = username;
  }

  void initFromStorage({
    required String accessToken,
    required String userId,
    required String username,
  }) {
    _accessToken = accessToken;
    _userId = userId;
    this.username = username;
  }

  void update({
    String? accessToken,
    String? userId,
    String? username,
  }) {
    if (accessToken == null) {
      throw Exception('no accessToken');
    }
    if (userId == null) {
      throw Exception('no userId');
    }
    _accessToken = accessToken;
    _userId = userId;
    this.username = username;
  }

  void destroy() {
    _accessToken = null;
    _userId = null;
    username = null;
  }
}
