import 'package:bookshelf/generated/assets.gen.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/provider/brightness_provider.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAppBar {
  static PreferredSizeWidget create(
    BuildContext context, {
    Color? color,
    Color backgroundColor = Colors.transparent,
    List<Widget>? actions,
    Brightness? brightness,
    Widget? leading,
    VoidCallback? onBack,
    bool? hasBack,
  }) {
    final colors = AppTheme.of(context).colors;

    final colorLocal = color ?? colors.black;

    final canBack = hasBack ?? Navigator.of(context).canPop();

    return AppBar(
      titleSpacing: 16.w,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness ?? getIt<BrightnessProvider>().value(),
      ),
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: colorLocal,
      ),
      elevation: 0,
      automaticallyImplyLeading: hasBack ?? Navigator.of(context).canPop(),
      leading: leading ??
          (canBack
              ? CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () => onBack == null ? Navigator.of(context).pop() : onBack.call(),
                  child: Assets.images.back.svg(
                    color: colorLocal,
                  ),
                )
              : null),
      actions: <Widget>[
        if (actions != null) ...actions,
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}
