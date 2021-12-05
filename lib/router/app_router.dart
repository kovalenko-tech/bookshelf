import 'package:auto_route/annotations.dart';
import 'package:bookshelf/modules/auth/modules/login/login.dart';
import 'package:bookshelf/modules/auth/modules/register/register.dart';
import 'package:bookshelf/modules/auth/page/auth.dart';
import 'package:bookshelf/modules/auth/stack.dart';
import 'package:bookshelf/modules/launch/launch.dart';
import 'package:bookshelf/modules/main/modules/modules.dart';
import 'package:bookshelf/modules/main/page/main.dart';
import 'package:bookshelf/modules/main/stack.dart';

@MaterialAutoRouter(
  routes: <AutoRoute<dynamic>>[
    AutoRoute<void>(page: LaunchPage, initial: true),
    AutoRoute<void>(
      page: AuthStack,
      path: '/auth',
      name: 'AuthStack',
      children: [
        AutoRoute<void>(page: AuthPage, initial: true),
        AutoRoute<void>(page: LoginPage),
        AutoRoute<void>(page: RegisterPage),
      ],
    ),
    AutoRoute<void>(
      page: MainStack,
      path: '/main',
      name: 'MainStack',
      children: [
        AutoRoute<void>(page: MainPage, initial: true),
        AutoRoute<void>(page: DetailsPage),
      ],
    ),
  ],
)
class $AppRouter {}
