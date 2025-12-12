import 'package:book_app/core/widgets/custom_bext.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlPreview(BookModel books, context) async {
  Uri url = Uri.parse(books.volumeInfo.previewLink!);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText(
          text: 'Cannot launch ${books.volumeInfo.previewLink!}',
        ),
      ),
    );
  }
}
