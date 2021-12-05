import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class AppBlocObserver extends BlocObserver {
  final Logger _logger;

  AppBlocObserver({
    required Logger logger,
  }) : _logger = logger;

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.i('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.i('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      final localization = EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: await builder(),
      );
      await BlocOverrides.runZoned(
        () async => runApp(localization),
        blocObserver: getIt<AppBlocObserver>(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
