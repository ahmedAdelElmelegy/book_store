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

  late ScrollController _scrollController;
  int nextPageNumber = 1;
  bool _isFetching = false; // to prevent multiple simultaneous calls

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategorybookCubit>().fetchCategoryBooks(
        category: widget.category,
        pageNumber: nextPageNumber++,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollListener() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (!_isFetching && currentScroll >= 0.7 * maxScroll) {
      _isFetching = true;

      try {
        await context.read<CategorybookCubit>().fetchCategoryBooks(
          category: widget.category,
          pageNumber: nextPageNumber++,
        );
      } catch (e) {
        // Handle Dio errors here if needed
      } finally {
        _isFetching = false;
      }
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
                    : books.length + (state is CategorybookLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < books.length) {
                    if (books.isNotEmpty) {
                      return GestureDetector(
                        onTap: () {},
                        child: BookItem(
                          onTap: () {
                            context.push(Routes.bookview, extra: books[index]);
                          },
                          books: filterBooks.isNotEmpty
                              ? filterBooks[index]
                              : books[index],
                        ),
                      );
                    }
                    return const SizedBox();
                  } else {
                    return const SizedBox(
                      width: 60,
                      child: CustomLoadingIndicator(),
                    );
                  }
                },
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
      // backgroundColor: Colors.white, // Fixed color
      scrolledUnderElevation: 0,
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
      backgroundColor: Colors.white, // Fixed color
      elevation: 0, // Optional: remove shadow if you want
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
