import 'package:bookshelf/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressWidget extends StatelessWidget {
  final double size;
  final double width;
  final Color? color;

  const ProgressWidget({
    Key? key,
    this.size = 30,
    this.width = 2,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    return SizedBox(
      width: size.w,
      height: size.w,
      child: CircularProgressIndicator(
        strokeWidth: width,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? colors.white,
        ),
      ),
    );
  }
}
