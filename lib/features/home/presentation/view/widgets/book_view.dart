import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/Simularbook/simulat_book_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_view_bod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookView extends StatefulWidget {
  const BookView({super.key, required this.books});
  final BookModel books;
  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  void initState() {
    BlocProvider.of<SimulatBookCubit>(
      context,
    ).fetchSimularBooks(category: widget.books.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookViewBody(books: widget.books));
  }
}
