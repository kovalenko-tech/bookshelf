import 'package:flutter/services.dart';

class Formatter {
  static final trim = FilteringTextInputFormatter.allow(
    RegExp(r'[\S]'),
  );
}
