import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class FeatureBookItem extends StatelessWidget {
  const FeatureBookItem({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: size.width * .37,
        child: Column(
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
            SizedBox(height: 8),
            Text(
              books.volumeInfo.title.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppStyle.f14Urbanistbold,
            ),
          ],
        ),
      ),
    );
  }
}
