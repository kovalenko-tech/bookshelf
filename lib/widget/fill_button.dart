import 'package:bookshelf/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'debounce_button.dart';
import 'progress_widget.dart';

class FillButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool loading;
  final VoidCallback onPressed;

  const FillButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.loading = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final textTheme = AppTheme.of(context).textTheme;
    final gradient = AppTheme.of(context).gradient;

    return DebounceButton(
      onPressed: disabled || loading ? null : onPressed,
      child: Container(
        height: 64.w,
        decoration: BoxDecoration(
          color: disabled ? colors.disabled : Colors.white,
          borderRadius: BorderRadius.circular(
            12.w,
          ),
          gradient: disabled ? null : gradient.button,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              Center(
                child: ProgressWidget(
                  size: 30.w,
                ),
              )
            else
              Text(
                title.toUpperCase(),
                style: textTheme.medium18.white,
              ),
          ],
        ),
      ),
    );
  }
}
