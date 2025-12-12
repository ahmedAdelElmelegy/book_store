import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_newset_rate.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final void Function()? onTap;
  const BookItem({super.key, required this.books, this.onTap});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: size.height * .2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2.8 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FancyShimmerImage(
                    imageUrl: books.volumeInfo.imageLinks?.thumbnail ?? '',
                    errorWidget: Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: books.volumeInfo.title.toString(),
                      fontSize: 20,
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    CustomText(
                      text: books.volumeInfo.authors?[0] ?? '',
                      fontSize: 16,
                    ),
                    SizedBox(height: size.height * .01),
                    CustomNewsetRate(
                      size: size,
                      printType: books.volumeInfo.pageCount.toString(),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.bookmark_border, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}
