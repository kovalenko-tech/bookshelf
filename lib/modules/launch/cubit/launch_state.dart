part of 'launch_cubit.dart';

@freezed
abstract class LaunchState with _$LaunchState {
  const factory LaunchState.initial() = _InitialState;
  const factory LaunchState.login() = _LoginState;
  const factory LaunchState.home() = _HomeState;
}
