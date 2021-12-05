import 'package:bloc/bloc.dart';
import 'package:bookshelf/repository/repository.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'launch_state.dart';
part 'launch_cubit.freezed.dart';

@lazySingleton
class LaunchCubit extends Cubit<LaunchState> {
  final AppRouter _appRouter;
  final SessionRepository _sessionRepository;
  LaunchCubit({
    required AppRouter appRouter,
    required SessionRepository sessionRepository,
  })  : _appRouter = appRouter,
        _sessionRepository = sessionRepository,
        super(const _InitialState());

  Future<void> start() async {
    await _sessionRepository.initSessionFromStorage();
    if (_sessionRepository.isValidSession) {
      await _appRouter.replaceAll([
        const MainStack(
          children: [
            MainPageRoute(),
          ],
        )
      ]);
    } else {
      await _appRouter.replaceAll([
        const AuthStack(
          children: [
            AuthPageRoute(),
          ],
        )
      ]);
    }
  }
}
