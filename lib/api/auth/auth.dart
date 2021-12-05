import 'package:bookshelf/models/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/auth/register')
  Future<AuthResponse> register(
    @Body() AuthRequest input,
  );

  @POST('/auth/login')
  Future<AuthResponse> login(
    @Body() AuthRequest input,
  );
}
