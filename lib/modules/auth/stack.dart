import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthStack extends StatelessWidget implements AutoRouteWrapper {
  const AuthStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}
