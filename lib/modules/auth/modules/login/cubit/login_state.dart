part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _InitialState;
  const factory LoginState.loading() = _LoadingState;
  const factory LoginState.success() = _SuccessState;
  const factory LoginState.error(String message) = _ErrorState;
}
