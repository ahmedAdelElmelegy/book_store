part of 'categorybook_cubit.dart';

sealed class CategorybookState extends Equatable {
  const CategorybookState();

  @override
  List<Object> get props => [];
}

final class CategorybookInitial extends CategorybookState {}

final class CategorybookSucess extends CategorybookState {
  final List<BookModel> books;
  const CategorybookSucess({required this.books});
}

final class CategorybookLoading extends CategorybookState {}

final class CategorybookLoadingMore extends CategorybookState {}

final class CategorybookFailure extends CategorybookState {
  final String erorrMassage;
  const CategorybookFailure({required this.erorrMassage});
}
