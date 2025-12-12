import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/Repo/home_repo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'categorybook_state.dart';

class CategorybookCubit extends Cubit<CategorybookState> {
  CategorybookCubit(this.homeRepo) : super(CategorybookInitial());
  final HomeRepo homeRepo;
  List<BookModel> bookList = [];
  Future<void> fetchCategoryBooks({
    required String category,
    int pageNumber = 0,
  }) async {
    if (pageNumber == 0) {
      emit(CategorybookLoading());
      bookList.clear();
    } else {
      emit(CategorybookLoadingMore());
    }
    var result = await homeRepo.fetchCategoryBooks(category: category);
    result.fold(
      (failure) {
        emit(
          CategorybookFailure(erorrMassage: failure.erorrMassage.toString()),
        );
      },
      (books) {
        bookList.addAll(books);
        emit(CategorybookSucess(books: bookList));
      },
    );
  }
}
