import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/Repo/home_repo.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'simulat_book_state.dart';

class SimulatBookCubit extends Cubit<SimulatBookState> {
  SimulatBookCubit(this.homeRepo) : super(SimulatBookInitial());
  HomeRepo homeRepo;

  Future<void> fetchSimularBooks({required String category}) async {
    emit(SimulatBookLoading());
    var result = await homeRepo.fetchsimularBooks(category: category);
    result.fold(
      (failure) {
        emit(SimulatBookFailure(erorrMassage: failure.erorrMassage.toString()));
      },
      (books) {
        emit(SimulatBookSucess(books: books));
      },
    );
  }
}
