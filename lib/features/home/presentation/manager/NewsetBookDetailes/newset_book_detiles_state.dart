part of 'newset_book_detiles_cubit.dart';

sealed class NewsetBookDetilesState extends Equatable {
  const NewsetBookDetilesState();

  @override
  List<Object> get props => [];
}

final class NewsetBookDetilesInitial extends NewsetBookDetilesState {}

final class NewsetBookDetilesLoading extends NewsetBookDetilesState {}

final class NewsetBookDetilesLoadingMore extends NewsetBookDetilesState {}

final class NewsetBookDetilesFailed extends NewsetBookDetilesState {
  final String erorrMassage;

  const NewsetBookDetilesFailed({required this.erorrMassage});
}

final class NewsetBookDetilesSucess extends NewsetBookDetilesState {
  final List<BookModel> books;

  const NewsetBookDetilesSucess({required this.books});
}

final class NewsetBookSearch extends NewsetBookDetilesState {}
