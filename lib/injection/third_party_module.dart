import 'dart:io';

import 'package:bookshelf/environment.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/repository/repository.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class ThirdPartyModule {
  @lazySingleton
  AppRouter get router => AppRouter();

  @lazySingleton
  Logger get logger => Logger();

  @preResolve
  Future<Dio> get dio async {
    final options = BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      sendTimeout: 20000,
    )..baseUrl = EnvironmentKey.baseUrl;

    final dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final sessionRepository = getIt<SessionRepository>();
          if (sessionRepository.isValidSession) {
            options.headers['Authorization'] = 'Bearer ${sessionRepository.accessToken}';
          }
          handler.next(options);
        },
      ),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client
        ..findProxy = (url) {
          return 'PROXY localhost:8888; DIRECT';
        }
        ..badCertificateCallback = (
          X509Certificate cert,
          String host,
          int port,
        ) =>
            Platform.isAndroid;
    };
    return Future.value(dio);
  }
}
