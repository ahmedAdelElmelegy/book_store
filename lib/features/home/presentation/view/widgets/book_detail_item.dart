import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_action.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_rating.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_details_section.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_detail_action.dart';
import 'package:book_app/features/home/presentation/view/widgets/simular_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailBody extends StatelessWidget {
  const BookDetailBody({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: SizedBox(height: size.height * .04)),
                const BookDetailActions(),
                BookDetailItem(book: books),
                Expanded(child: SizedBox(height: size.height * .02)),
                BookRating(
                  count: books.volumeInfo.pageCount.toString(),
                  size: size,
                ),
                Expanded(child: SizedBox(height: size.height * .02)),
                BookAction(book: books),
                Expanded(child: SizedBox(height: size.height * .08)),
                SimularBookSection(category: books.volumeInfo.categories![0]),
                Expanded(child: SizedBox(height: size.height * .01)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
