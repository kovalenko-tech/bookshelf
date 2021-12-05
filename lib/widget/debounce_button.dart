import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class DebounceButton extends StatelessWidget {
  final Widget child;

  final VoidCallback? onPressed;
  const DebounceButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
      cooldown: const Duration(milliseconds: 500),
      onTap: onPressed == null ? null : () async => onPressed?.call(),
      builder: (context, onTap) => CupertinoButton(
        minSize: 0,
        onPressed: onTap,
        padding: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
