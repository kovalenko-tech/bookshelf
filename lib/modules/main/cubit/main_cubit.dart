import 'package:bloc/bloc.dart';
import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/modules/main/repository/main.dart';
import 'package:bookshelf/repository/repository.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:bookshelf/utils/network_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

@lazySingleton
class MainCubit extends Cubit<MainState> {
  final AppRouter _appRouter;
  final MainRepository _mainRepository;
  final SessionRepository _sessionRepository;

  final search = TextEditingController();

  var _lastSearch = '';

  MainCubit({
    required AppRouter appRouter,
    required MainRepository mainRepository,
    required SessionRepository sessionRepository,
  })  : _appRouter = appRouter,
        _mainRepository = mainRepository,
        _sessionRepository = sessionRepository,
        super(const _InitialState()) {
    search.addListener(() {
      if (search.text == _lastSearch) {
        return;
      }
      if (search.text.length > 2) {
        fetch(search: search.text);
      } else if (_lastSearch.length == 3) {
        fetch();
      }
      _lastSearch = search.text;
    });
  }

  Future<void> fetch({String search = ''}) async {
    emit(const _LoadingState());
    final response = await _mainRepository.list(search: search);
    emit(
      response.fold(
        () {
          return _ErrorState(LocaleKeys.error_sww.tr());
        },
        (a) => a.fold(
          (l) {
            if (l is NetworkException) {
              return _ErrorState(l.message);
            }
            return _ErrorState(LocaleKeys.error_sww.tr());
          },
          (r) => _SuccessState(r),
        ),
      ),
    );
  }

  Future<void> logout() async {
    await _sessionRepository.destroySession();
    await _appRouter.replaceAll([
      const AuthStack(
        children: [
          AuthPageRoute(),
        ],
      )
    ]);
  }
}
