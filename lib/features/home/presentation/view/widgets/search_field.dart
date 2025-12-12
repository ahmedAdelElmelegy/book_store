import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/core/widgets/custom_text_field.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_listview_newst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<BookModel> books = [];
  List<BookModel> filterBooks = [];

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: size.height * .04),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded, size: 30),
                ),
                SizedBox(width: size.width * .01),
                SizedBox(
                  width: size.width * .70,
                  child: CustomTextField(
                    hintText: 'Search',
                    controller: searchController,
                    onChanged: (input) {
                      setState(() {
                        addDatatoFilteredData(input: input);
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchController.text = "";
                    });
                  },
                  icon: const Icon(Icons.clear, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: size.height * .03),
            BlocBuilder<NewsetBookDetilesCubit, NewsetBookDetilesState>(
              builder: (context, state) {
                if (state is NewsetBookDetilesSucess) {
                  books = state.books;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filterBooks.isNotEmpty
                          ? filterBooks.length
                          : state.books.length,
                      itemBuilder: (context, index) => CustomNewBookListItem(
                        books: filterBooks.isNotEmpty
                            ? filterBooks[index]
                            : state.books[index],
                      ),
                    ),
                  );
                } else if (state is NewsetBookDetilesFailed) {
                  return CustomErorrFailure(failureMassage: state.erorrMassage);
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            ),
          ],
        ),
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
}
