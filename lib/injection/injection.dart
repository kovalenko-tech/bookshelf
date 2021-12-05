import 'package:bookshelf/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection({
  required String environment,
}) async {
  await $initGetIt(getIt, environment: environment);
}
