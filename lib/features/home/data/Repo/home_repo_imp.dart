import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/features/home/data/Repo/home_repo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks({
    int pageNumber = 0,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:medicine&startIndex=${pageNumber * 10}',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel?>>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:egypt&startIndex=${pageNumber * 10}',
      );
      List<BookModel?> books = [];
      var items = data['items'] as List<dynamic>?; // null-aware cast
      if (items != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchsimularBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchCategoryBooks({
    required String category,
    int pageNumber = 0,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance&startIndex=${pageNumber * 10}',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
