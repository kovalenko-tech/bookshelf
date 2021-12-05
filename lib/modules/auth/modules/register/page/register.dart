import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/modules/auth/modules/register/cubit/register_cubit.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:bookshelf/utils/formatter.dart';
import 'package:bookshelf/widget/base_appbar.dart';
import 'package:bookshelf/widget/enter_field.dart';
import 'package:bookshelf/widget/error_message.dart';
import 'package:bookshelf/widget/fill_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterCubit cubit;

  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    cubit = getIt<RegisterCubit>();
    super.initState();

    usernameFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc: cubit,
      listener: (context, state) {
        state.whenOrNull(
          error: (message) => ErrorMessage.open(
            context,
            message: message,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: BaseAppBar.create(
            context,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: BlocBuilder<RegisterCubit, RegisterState>(
              bloc: cubit,
              builder: (context, state) {
                return FillButton(
                  loading: state.maybeMap(
                    loading: (_) => true,
                    orElse: () => false,
                  ),
                  title: LocaleKeys.register_button.tr(),
                  onPressed: () => cubit.submit(),
                );
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 18.h,
            ),
            child: Column(
              children: [
                Text(
                  LocaleKeys.register_title.tr(),
                  style: AppTheme.of(context).textTheme.demi24,
                ),
                SizedBox(
                  height: 24.h,
                ),
                EnterField(
                  focusNode: usernameFocus,
                  controller: cubit.username,
                  labelText: LocaleKeys.register_fields_title.tr(),
                  inputFormatters: [
                    Formatter.trim,
                  ],
                  onEditingComplete: passwordFocus.requestFocus,
                ),
                SizedBox(
                  height: 24.h,
                ),
                EnterField(
                  focusNode: passwordFocus,
                  controller: cubit.password,
                  obscureText: true,
                  labelText: LocaleKeys.register_fields_password.tr(),
                  inputFormatters: [
                    Formatter.trim,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
