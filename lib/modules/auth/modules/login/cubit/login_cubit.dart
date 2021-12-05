import 'package:bloc/bloc.dart';
import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/modules/auth/repository/auth.dart';
import 'package:bookshelf/repository/repository.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:bookshelf/utils/network_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AppRouter _appRouter;
  final AuthRepository _authRepository;
  final SessionRepository _sessionRepository;

  final username = TextEditingController();
  final password = TextEditingController();

  LoginCubit({
    required AppRouter appRouter,
    required AuthRepository authRepository,
    required SessionRepository sessionRepository,
  })  : _appRouter = appRouter,
        _authRepository = authRepository,
        _sessionRepository = sessionRepository,
        super(const _InitialState());

  Future<void> submit() async {
    emit(const _LoadingState());
    final input = AuthRequest(
      username: username.text,
      password: password.text,
    );
    final response = await _authRepository.login(input);
    emit(
      await response.fold(
        () => _ErrorState(LocaleKeys.error_sww.tr()),
        (a) => a.fold((l) {
          if (l is NetworkException) {
            return _ErrorState(l.message);
          }
          return _ErrorState(LocaleKeys.error_sww.tr());
        }, (r) async {
          await _sessionRepository.initSession(
            accessToken: r.user.token,
            userId: r.user.id,
            username: r.user.username,
          );

          username.clear();
          password.clear();

          await _appRouter.replaceAll([
            const MainStack(
              children: [
                MainPageRoute(),
              ],
            )
          ]);

          return const _SuccessState();
        }),
      ),
    );
  }
}
