import 'package:book_app/features/home/data/models/book_model/book_model.dart';

String gettext(BookModel books) {
  if (books.volumeInfo.previewLink == null) {
    return 'Not Avaliable';
  } else {
    return 'Preview';
  }
}
