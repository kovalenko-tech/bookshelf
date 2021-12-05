import 'package:bookshelf/api/auth/auth.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/utils/safe_network_operation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final AuthApi _authApi;

  AuthRepository({
    required AuthApi authApi,
  }) : _authApi = authApi;

  Future<Option<Either<Exception, AuthResponse>>> register(AuthRequest input) => safeNetworkOperation(
        () => _authApi.register(input),
      );

  Future<Option<Either<Exception, AuthResponse>>> login(AuthRequest input) => safeNetworkOperation(
        () => _authApi.login(input),
      );
}
