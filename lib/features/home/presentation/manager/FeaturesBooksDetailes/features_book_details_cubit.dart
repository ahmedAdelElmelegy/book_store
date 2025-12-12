import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/Repo/home_repo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'features_book_details_state.dart';

class FeaturesBookDetailsCubit extends Cubit<FeaturesBookDetailsState> {
  FeaturesBookDetailsCubit(this.homeRepo) : super(FeaturesBookDetailsInitial());
  final HomeRepo homeRepo;
  List<BookModel?> bookList = [];
  Future<void> fetchFeaturesBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturesBookDetailsLoading());
    } else {
      emit(PagenationLoading());
    }

    var result = await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
    result.fold(
      (failure) {
        emit(
          FeaturesBookDetailsFailure(
            erorrMassage: failure.erorrMassage.toString(),
          ),
        );
      },
      (books) {
        bookList.addAll(books);
        emit(FeaturesBookDetailsSucess(books: bookList));
      },
    );
  }
}
