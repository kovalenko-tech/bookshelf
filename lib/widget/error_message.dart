import 'package:bookshelf/generated/assets.gen.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorMessage extends StatelessWidget {
  final String title;

  const ErrorMessage({
    Key? key,
    required this.title,
  }) : super(key: key);

  static Future<void> open(
    BuildContext context, {
    required String message,
  }) async {
    FocusScope.of(context).requestFocus(FocusNode());
    await showFlash(
      context: context,
      builder: (context, controller) {
        return Flash<void>(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.w,
            ),
            child: ErrorMessage(
              title: message,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final textTheme = AppTheme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.red,
        borderRadius: BorderRadius.circular(
          12.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 28.w,
          top: 10.w,
          bottom: 10.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.images.info.svg(
              height: 17.w,
              width: 17.w,
              color: colors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                title,
                style: textTheme.book14.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
