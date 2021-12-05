// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../modules/auth/modules/login/login.dart' as _i5;
import '../modules/auth/modules/register/register.dart' as _i6;
import '../modules/auth/page/auth.dart' as _i4;
import '../modules/auth/stack.dart' as _i2;
import '../modules/launch/launch.dart' as _i1;
import '../modules/main/modules/modules.dart' as _i8;
import '../modules/main/page/main.dart' as _i7;
import '../modules/main/stack.dart' as _i3;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LaunchPageRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i1.LaunchPage());
    },
    AuthStack.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i2.AuthStack());
    },
    MainStack.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i3.MainStack());
    },
    AuthPageRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i4.AuthPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i5.LoginPage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i6.RegisterPage());
    },
    MainPageRoute.name: (routeData) {
      return _i9.MaterialPageX<void>(
          routeData: routeData, child: const _i7.MainPage());
    },
    DetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsPageRouteArgs>();
      return _i9.MaterialPageX<void>(
          routeData: routeData,
          child: _i8.DetailsPage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LaunchPageRoute.name, path: '/'),
        _i9.RouteConfig(AuthStack.name, path: '/auth', children: [
          _i9.RouteConfig(AuthPageRoute.name, path: '', parent: AuthStack.name),
          _i9.RouteConfig(LoginPageRoute.name,
              path: 'login-page', parent: AuthStack.name),
          _i9.RouteConfig(RegisterPageRoute.name,
              path: 'register-page', parent: AuthStack.name)
        ]),
        _i9.RouteConfig(MainStack.name, path: '/main', children: [
          _i9.RouteConfig(MainPageRoute.name, path: '', parent: MainStack.name),
          _i9.RouteConfig(DetailsPageRoute.name,
              path: 'details-page', parent: MainStack.name)
        ])
      ];
}

/// generated route for [_i1.LaunchPage]
class LaunchPageRoute extends _i9.PageRouteInfo<void> {
  const LaunchPageRoute() : super(name, path: '/');

  static const String name = 'LaunchPageRoute';
}

/// generated route for [_i2.AuthStack]
class AuthStack extends _i9.PageRouteInfo<void> {
  const AuthStack({List<_i9.PageRouteInfo>? children})
      : super(name, path: '/auth', initialChildren: children);

  static const String name = 'AuthStack';
}

/// generated route for [_i3.MainStack]
class MainStack extends _i9.PageRouteInfo<void> {
  const MainStack({List<_i9.PageRouteInfo>? children})
      : super(name, path: '/main', initialChildren: children);

  static const String name = 'MainStack';
}

/// generated route for [_i4.AuthPage]
class AuthPageRoute extends _i9.PageRouteInfo<void> {
  const AuthPageRoute() : super(name, path: '');

  static const String name = 'AuthPageRoute';
}

/// generated route for [_i5.LoginPage]
class LoginPageRoute extends _i9.PageRouteInfo<void> {
  const LoginPageRoute() : super(name, path: 'login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for [_i6.RegisterPage]
class RegisterPageRoute extends _i9.PageRouteInfo<void> {
  const RegisterPageRoute() : super(name, path: 'register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for [_i7.MainPage]
class MainPageRoute extends _i9.PageRouteInfo<void> {
  const MainPageRoute() : super(name, path: '');

  static const String name = 'MainPageRoute';
}

/// generated route for [_i8.DetailsPage]
class DetailsPageRoute extends _i9.PageRouteInfo<DetailsPageRouteArgs> {
  DetailsPageRoute({_i10.Key? key, required String id})
      : super(name,
            path: 'details-page', args: DetailsPageRouteArgs(key: key, id: id));

  static const String name = 'DetailsPageRoute';
}

class DetailsPageRouteArgs {
  const DetailsPageRouteArgs({this.key, required this.id});

  final _i10.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailsPageRouteArgs{key: $key, id: $id}';
  }
}
