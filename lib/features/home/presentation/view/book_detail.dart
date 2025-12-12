import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_detail_item.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.books});
  final BookModel books;
  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailBody(books: widget.books));
  }
}
