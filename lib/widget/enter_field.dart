import 'package:bookshelf/generated/assets.gen.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterFieldDropItem {
  final String id;
  final String title;
  final String? subtitle;

  EnterFieldDropItem({
    required this.id,
    required this.title,
    this.subtitle,
  });
}

class EnterField extends StatefulWidget {
  final bool enabled;
  final String? hintText;
  final Color? fillColor;
  final bool obscureText;
  final TextStyle? style;
  final String? errorText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<EnterFieldDropItem>? results;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final TextEditingController controller;
  final ValueChanged<EnterFieldDropItem>? onSelectedResult;
  final List<TextInputFormatter>? inputFormatters;

  const EnterField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.fillColor,
    this.enabled = true,
    this.obscureText = false,
    this.onEditingComplete,
    this.onSelectedResult,
    this.results,
    this.style,
    this.textAlign,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _EnterFieldState createState() => _EnterFieldState();
}

class _EnterFieldState extends State<EnterField> {
  late FocusNode focusNode;

  bool hasFocus = false;
  bool obscureText = true;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    super.initState();

    focusNode.addListener(() {
      if (!mounted) return;

      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final textTheme = AppTheme.of(context).textTheme;
    final shadow = AppTheme.of(context).shadow;

    return Opacity(
      opacity: widget.enabled ? 1 : 0.4,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: hasFocus
              ? [
                  shadow.card,
                ]
              : [],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                TextField(
                  textAlign: widget.textAlign ?? TextAlign.start,
                  obscureText: widget.obscureText && obscureText,
                  focusNode: focusNode,
                  controller: widget.controller,
                  cursorColor: colors.tiffany,
                  style: widget.style ?? textTheme.book20,
                  enabled: widget.enabled,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType,
                  onEditingComplete: widget.onEditingComplete,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: widget.fillColor ?? colors.white,
                    hintText: widget.hintText,
                    hintStyle: textTheme.book20.grey,
                    errorText: widget.errorText,
                    errorStyle: textTheme.book14.red,
                    errorMaxLines: 2,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon ??
                        (widget.obscureText
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 20.w,
                                  height: 20.w,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      obscureText ? Assets.images.obscureEnabled.path : Assets.images.obscure.path,
                                      color: colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            : null),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    errorBorder: OutlineInputBorder(
                      borderRadius: _getBorderRadius(),
                      borderSide: BorderSide(
                        color: colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: _getBorderRadius(),
                      borderSide: BorderSide(
                        color: colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: _getBorderRadius(),
                      borderSide: BorderSide(
                        color: colors.grey.withOpacity(0.2),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: _getBorderRadius(),
                      borderSide: BorderSide(
                        color: colors.grey.withOpacity(0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: _getBorderRadius(),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                if (widget.labelText != null)
                  Container(
                    transform: Matrix4.translationValues(0, -9.w, 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        Stack(
                          children: [
                            Container(
                              transform: Matrix4.translationValues(-4.w, 9.w, 0),
                              color: colors.white,
                              height: 1.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                              ),
                              child: Text(
                                widget.labelText!,
                                style: textTheme.book14.grey,
                              ),
                            ),
                            Text(
                              widget.labelText!,
                              style: textTheme.book14.copyWith(
                                color: widget.errorText == null ? colors.grey : colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            if ((widget.results ?? []).isNotEmpty && hasFocus)
              Container(
                decoration: BoxDecoration(
                  color: colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.w),
                    bottomRight: Radius.circular(12.w),
                  ),
                ),
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: Column(
                    children: [
                      Container(
                        height: 0.5.h,
                        color: colors.black.withOpacity(0.06),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: widget.results!.length <= 2 ? widget.results!.length * 40.h : 120.h,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                widget.onSelectedResult?.call(
                                  widget.results![index],
                                );
                                widget.controller.text = widget.results![index].title;
                                Future.delayed(const Duration(milliseconds: 1), () {
                                  widget.controller.selection = TextSelection(
                                    baseOffset: widget.controller.text.length,
                                    extentOffset: widget.controller.text.length,
                                  );
                                });
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                ),
                                height: 40.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.results![index].title,
                                        style: textTheme.book18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      widget.results![index].subtitle ?? '',
                                      style: textTheme.book12.grey,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container();
                          },
                          itemCount: widget.results!.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  BorderRadius _getBorderRadius() {
    if ((widget.results ?? []).isEmpty || !hasFocus) {
      return BorderRadius.circular(12.w);
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(12.w),
        topRight: Radius.circular(12.w),
      );
    }
  }
}
