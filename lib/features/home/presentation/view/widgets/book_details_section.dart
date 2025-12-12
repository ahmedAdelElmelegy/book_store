import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

class BookDetailItem extends StatelessWidget {
  const BookDetailItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: size.height * .3,
            child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: FancyShimmerImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * .04),
        Text(book.volumeInfo.title ?? "", style: AppStyle.f30UrbanistBold),

        SizedBox(height: size.height * .01),
        Opacity(
          opacity: .7,
          child: CustomText(text: book.volumeInfo.authors![0], fontSize: 18),
        ),
        SizedBox(height: size.height * .005),
      ],
    );
  }
}
