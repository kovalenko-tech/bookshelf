import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainStack extends StatelessWidget implements AutoRouteWrapper {
  const MainStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}
