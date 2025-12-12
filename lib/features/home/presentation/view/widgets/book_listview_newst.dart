import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/utils/routes.dart';
import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_newset_rate.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNewBookListItem extends StatelessWidget {
  const CustomNewBookListItem({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.bookview, extra: books);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: size.height * .15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 2.8 / 4,
                  child: FancyShimmerImage(
                    imageUrl: books.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
              ),
              SizedBox(width: size.width * .03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      books.volumeInfo.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.f18UrbanistBold,
                      maxLines: 2,
                    ),
                    SizedBox(height: size.height * .01),
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
