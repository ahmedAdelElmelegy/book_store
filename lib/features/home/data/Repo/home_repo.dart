import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BookModel>>> fetchsimularBooks({
    required String category,
  });
  Future<Either<Failure, List<BookModel>>> fetchCategoryBooks({
    required String category,
    int pageNumber = 0,
  });
}
