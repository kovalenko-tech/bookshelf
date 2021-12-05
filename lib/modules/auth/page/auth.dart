import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:bookshelf/generated/assets.gen.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:bookshelf/theme/elevation.dart';
import 'package:bookshelf/widget/fill_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  AppRouter get route => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Assets.images.logo.image(
                width: 240.w,
              ),
            ),
            Center(
              child: Text(
                LocaleKeys.auth_title.tr(),
                style: AppTheme.of(context).textTheme.demi28,
              ),
            ),
            SizedBox(
              height: Elevation.$64dp.value,
            ),
            FillButton(
              title: LocaleKeys.auth_buttons_login.tr(),
              onPressed: () => route.push(const LoginPageRoute()),
            ),
            SizedBox(
              height: Elevation.$16dp.value,
            ),
            FillButton(
              title: LocaleKeys.auth_buttons_register.tr(),
              onPressed: () => route.push(RegisterPageRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
