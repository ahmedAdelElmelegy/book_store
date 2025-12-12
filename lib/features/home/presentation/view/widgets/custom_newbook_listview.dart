import 'package:book_app/core/utils/routes.dart';
import 'package:book_app/core/widgets/book_item.dart';
import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNewbookListview extends StatefulWidget {
  const CustomNewbookListview({super.key});

  @override
  State<CustomNewbookListview> createState() => _CustomNewbookListviewState();
}

class _CustomNewbookListviewState extends State<CustomNewbookListview> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scroolListener);

    super.initState();
  }

  int nextPagenumber = 1;
  @override
  void dispose() {
    _scrollController.removeListener(_scroolListener); // ✅ Remove listener

    _scrollController.dispose();
    super.dispose();
  }

  // scrool
  void _scroolListener() {
    final currentPostion = _scrollController.position.pixels;
    if (currentPostion >= .7 * _scrollController.position.maxScrollExtent) {
      context.read<NewsetBookDetilesCubit>().fetchNewsetBooks(
        pageNumber: nextPagenumber++,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBookDetilesCubit, NewsetBookDetilesState>(
      builder: (context, state) {
        final books = context.read<NewsetBookDetilesCubit>().books;
        if (state is NewsetBookDetilesLoading) {
          return const CustomLoadingIndicator();
        } else if (state is NewsetBookDetilesFailed) {
          return CustomErorrFailure(failureMassage: state.erorrMassage);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            controller: _scrollController,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: books.length,
            itemBuilder: (context, index) => InkWell(
              child: BookItem(books: books[index]),
              onTap: () {
                context.push(Routes.bookview, extra: books[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
