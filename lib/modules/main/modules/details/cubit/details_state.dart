part of 'details_cubit.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _InitialState;
  const factory DetailsState.loading() = _LoadingState;
  const factory DetailsState.success(Book model) = _SuccessState;
  const factory DetailsState.error(String message) = _ErrorState;
}
