import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/utils/routes.dart';
import 'package:book_app/core/widgets/book_item.dart';
import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/core/widgets/custom_text_field.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/category_book/categorybook_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_action_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatefulWidget {
  final String category;
  const CategoryView({super.key, required this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<BookModel> books = [];
  List<BookModel> filterBooks = [];
  bool isSearch = false;
  var searchController = TextEditingController();
  @override
  void didUpdateWidget(covariant CategoryView oldWidget) {
    if (oldWidget.category != widget.category) {
      context.read<CategorybookCubit>().fetchCategoryBooks(
        category: widget.category,
        pageNumber: 0,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scroolListener);

    context.read<CategorybookCubit>().fetchCategoryBooks(
      category: widget.category,
      pageNumber: 0,
    );
    super.initState();
  }

  late ScrollController _scrollController;

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
      context.read<CategorybookCubit>().fetchCategoryBooks(
        category: widget.category,
        pageNumber: nextPagenumber++,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearch ? appText() : searchicon(widget.category),
      body: BlocBuilder<CategorybookCubit, CategorybookState>(
        builder: (context, state) {
          if (state is CategorybookSucess || state is CategorybookLoadingMore) {
            books = context.read<CategorybookCubit>().bookList;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: filterBooks.isNotEmpty
                    ? filterBooks.length
                    : books.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: BookItem(
                    onTap: () {
                      context.push(Routes.bookview, extra: books[index]);
                    },
                    books: filterBooks.isNotEmpty
                        ? filterBooks[index]
                        : books[index],
                  ),
                ),
              ),
            );
          } else if (state is CategorybookFailure) {
            return CustomErorrFailure(failureMassage: state.erorrMassage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }

  void addDatatoFilteredData({required String input}) {
    setState(() {
      filterBooks = books
          .where(
            (element) =>
                element.volumeInfo.title!.toLowerCase().startsWith(input),
          )
          .toList();
    });
  }

  PreferredSizeWidget searchicon(String category) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      title: Text(category, style: AppStyle.f24UrbanistBold),
      centerTitle: true,
      actions: [
        CustomActionButtom(
          onPressed: () {
            setState(() {
              isSearch = true;
            });
          },
        ),
      ],
    );
  }

  PreferredSizeWidget appText() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomTextField(
        hintText: "Science",
        onChanged: (input) {
          addDatatoFilteredData(input: input);
        },
        controller: searchController,
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              searchController.text = "";
            });
          },
          icon: const Icon(Icons.clear, color: Colors.red),
        ),
      ],
    );
  }
}
