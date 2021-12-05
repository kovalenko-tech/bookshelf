import 'package:bookshelf/repository/secure/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class SecureRepository extends FlutterSecureStorage {
  final Logger _logger;

  SecureRepository({
    required Logger logger,
  }) : _logger = logger;

  Future<void> addToStorage(String key, String value) async {
    await write(key: key, value: value).then((void data) {
      _logger.i('$key: $value added to secure storage');
    });
  }

  /// Delete all values from storage
  Future<bool> clearSecureStorage() async {
    return deleteAll().then((void data) {
      _logger.i('Secure storage has been cleared');
      return true;
    });
  }

  /// Delete value by key
  Future<void> deleteFromStorage(String key) async {
    await delete(key: key).then((void data) {
      _logger.i('$key deleted from secure storage');
    });
  }

  /// Get all values
  Future<Map<String, String>> getAllFromStorage() async {
    return readAll();
  }

  /// Get string value by key
  Future<String?> getFromStorage(String key) async {
    return read(key: key);
  }

  Future<void> persistUserData({
    required String accessToken,
    required String userId,
    required String username,
  }) async {
    await Future.wait([
      addToStorage(StorageConstants.accessTokenKey, accessToken),
      addToStorage(StorageConstants.userIdKey, userId),
      addToStorage(StorageConstants.usernameKey, username),
    ]);
  }
}
