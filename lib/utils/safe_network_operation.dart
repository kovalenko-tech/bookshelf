import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:bookshelf/utils/network_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

Future<Option<Either<Exception, T>>> safeNetworkOperation<T>(
  NetworkOperation<T> operation,
) async {
  try {
    final response = await operation();
    return optionOf(right(response));
  } on DioError catch (error) {
    final map = error.response?.data as Map<String, dynamic>;

    return some(
      left(
        NetworkException(
          statusCode: error.response?.statusCode ?? 0,
          message: (map['message'] is String) ? map['message'] as String : LocaleKeys.error_sww.tr(),
        ),
      ),
    );
  } catch (error) {
    return some(
      left(
        error is Exception ? error : Exception(error),
      ),
    );
  }
}

typedef NetworkOperation<T> = Future<T> Function();
