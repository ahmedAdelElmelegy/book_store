part of 'simulat_book_cubit.dart';

sealed class SimulatBookState extends Equatable {
  const SimulatBookState();

  @override
  List<Object> get props => [];
}

final class SimulatBookInitial extends SimulatBookState {}

final class SimulatBookLoading extends SimulatBookState {}

final class SimulatBookLoadingMore extends SimulatBookState {}

final class SimulatBookSucess extends SimulatBookState {
  final List<BookModel> books;

  const SimulatBookSucess({required this.books});
}

final class SimulatBookFailure extends SimulatBookState {
  final String erorrMassage;

  const SimulatBookFailure({required this.erorrMassage});
}
