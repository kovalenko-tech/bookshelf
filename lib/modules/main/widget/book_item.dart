import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:bookshelf/widget/debounce_button.dart';
import 'package:bookshelf/widget/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItemWidget extends StatelessWidget {
  final Book model;
  final VoidCallback onPressed;
  const BookItemWidget({
    Key? key,
    required this.model,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DebounceButton(
      onPressed: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.w),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: theme.colors.white,
            boxShadow: [theme.shadow.card],
          ),
          child: Row(
            children: [
              ImageWidget(
                width: 80.w,
                imageUrl: model.coverImageUrl,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.medium14,
                      ),
                      Text(
                        model.publisher,
                        style: theme.textTheme.book12.grey,
                      ),
                      Text(
                        model.author,
                        style: theme.textTheme.book12.grey,
                      ),
                      Text(
                        model.synopsis,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.book14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
