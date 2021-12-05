part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _InitialState;
  const factory RegisterState.loading() = _LoadingState;
  const factory RegisterState.success() = _SuccessState;
  const factory RegisterState.error(String message) = _ErrorState;
}
