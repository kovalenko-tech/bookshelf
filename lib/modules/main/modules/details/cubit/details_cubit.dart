import 'package:bloc/bloc.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/modules/main/repository/main.dart';
import 'package:bookshelf/utils/network_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';

part 'details_state.dart';
part 'details_cubit.freezed.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  final MainRepository _mainRepository;
  DetailsCubit({
    required MainRepository mainRepository,
  })  : _mainRepository = mainRepository,
        super(const _InitialState());

  Future<void> fetch({required String id}) async {
    emit(const _LoadingState());
    final response = await _mainRepository.details(id: id);
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
          (r) => _SuccessState(r.book),
        ),
      ),
    );
  }
}
