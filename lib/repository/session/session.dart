import 'package:bookshelf/repository/secure/constants.dart';
import 'package:bookshelf/repository/secure/secure.dart';
import 'package:bookshelf/repository/session/model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class SessionRepository {
  final Session _session;
  final Logger _logger;
  final SecureRepository _secureRepository;

  SessionRepository({
    required Session session,
    required Logger logger,
    required SecureRepository secureRepository,
  })  : _session = session,
        _logger = logger,
        _secureRepository = secureRepository;

  String? get accessToken => _session.accessToken;

  String? get userId => _session.userId;

  String? get username => _session.username;

  bool get isValidSession => _session.isValidSession;

  Future<bool> initSession({
    String? accessToken,
    String? userId,
    String? username,
  }) async {
    _session.init(
      accessToken: accessToken,
      userId: userId,
      username: username,
    );

    if (accessToken != null && userId != null && username != null) {
      await _secureRepository.persistUserData(
        accessToken: accessToken,
        userId: userId,
        username: username,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateSession({
    String? accessToken,
    String? userId,
    String? username,
  }) async {
    _session.update(
      accessToken: accessToken,
      userId: userId,
      username: username,
    );

    if (accessToken != null && userId != null && username != null) {
      await _secureRepository.persistUserData(
        accessToken: accessToken,
        userId: userId,
        username: username,
      );
    }
  }

  Future<void> initSessionFromStorage() async {
    final accessToken = await _secureRepository.getFromStorage(StorageConstants.accessTokenKey);
    final userId = await _secureRepository.getFromStorage(StorageConstants.userIdKey);
    final username = await _secureRepository.getFromStorage(StorageConstants.usernameKey);

    _logger
      ..i('userId: $userId')
      ..i('username: $username')
      ..i('accessToken: $accessToken');

    if (accessToken != null && userId != null && username != null) {
      _session.initFromStorage(
        accessToken: accessToken,
        userId: userId,
        username: username,
      );
    } else {
      _logger.e('Error init session from storage:\naccessToken: $accessToken,\nuserId: $userId,\nusername: $username');
    }
  }

  Future<void> destroySession() async {
    _session.destroy();
    await _secureRepository.clearSecureStorage();
  }
}
