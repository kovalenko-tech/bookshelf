import 'package:bookshelf/api/api.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/utils/safe_network_operation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainRepository {
  final BookApi _bookApi;

  MainRepository({
    required BookApi bookApi,
  }) : _bookApi = bookApi;

  Future<Option<Either<Exception, BooksResponse>>> list({String search = ''}) => safeNetworkOperation(
        () => _bookApi.list(search),
      );

  Future<Option<Either<Exception, BookResponse>>> details({required String id}) => safeNetworkOperation(
        () => _bookApi.details(id),
      );
}
