import 'package:bookshelf/models/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'book.g.dart';

@lazySingleton
@RestApi()
abstract class BookApi {
  @factoryMethod
  factory BookApi(Dio dio) = _BookApi;

  @GET('/books')
  Future<BooksResponse> list(
    @Query('q') String search,
  );

  @GET('/books/{id}')
  Future<BookResponse> details(
    @Path() String id,
  );
}
