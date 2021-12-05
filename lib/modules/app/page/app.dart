import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  AppRouter get router => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp.router(
        theme: AppTheme.of(context).themeData,
        localizationsDelegates: [
          ...context.localizationDelegates,
          GlobalMaterialLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
