part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _InitialState;
  const factory MainState.loading() = _LoadingState;
  const factory MainState.success(BooksResponse model) = _SuccessState;
  const factory MainState.error(String message) = _ErrorState;
}
