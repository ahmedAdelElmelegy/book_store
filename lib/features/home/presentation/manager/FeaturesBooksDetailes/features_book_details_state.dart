part of 'features_book_details_cubit.dart';

sealed class FeaturesBookDetailsState extends Equatable {
  const FeaturesBookDetailsState();

  @override
  List<Object> get props => [];
}

final class FeaturesBookDetailsInitial extends FeaturesBookDetailsState {}

final class FeaturesBookDetailsLoading extends FeaturesBookDetailsState {}

// loading more
final class PagenationLoading extends FeaturesBookDetailsState {}

final class FeaturesBookDetailsFailure extends FeaturesBookDetailsState {
  final String erorrMassage;

  const FeaturesBookDetailsFailure({required this.erorrMassage});
}

final class FeaturesBookDetailsSucess extends FeaturesBookDetailsState {
  final List<BookModel?> books;

  const FeaturesBookDetailsSucess({required this.books});
}
