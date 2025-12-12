import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/Repo/home_repo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newset_book_detiles_state.dart';

class NewsetBookDetilesCubit extends Cubit<NewsetBookDetilesState> {
  NewsetBookDetilesCubit(this.homeRepo) : super(NewsetBookDetilesInitial());
  final HomeRepo homeRepo;
  List<BookModel> books = [];
  Future<void> fetchNewsetBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewsetBookDetilesLoading());
    } else {
      emit(NewsetBookDetilesLoadingMore());
    }
    var result = await homeRepo.fetchNewsBooks(pageNumber: pageNumber);
    result.fold(
      (failure) {
        emit(
          NewsetBookDetilesFailed(
            erorrMassage: failure.erorrMassage.toString(),
          ),
        );
      },
      (books) {
        this.books.addAll(books);
        emit(NewsetBookDetilesSucess(books: this.books));
      },
    );
  }

  bool isSearch = false;
  void search() {
    isSearch = !isSearch;
  }
}
