import 'package:book_app/core/utils/routes.dart';
import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home/presentation/manager/Simularbook/simulat_book_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_simular_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimularBookListView extends StatefulWidget {
  final String category;
  const SimularBookListView({super.key, required this.category});

  @override
  State<SimularBookListView> createState() => _SimularBookListViewState();
}

class _SimularBookListViewState extends State<SimularBookListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<SimulatBookCubit>().fetchSimularBooks(
        category: widget.category,
      );
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SimularBookListView oldWidget) {
    if (widget.category != oldWidget.category) {
      context.read<SimulatBookCubit>().fetchSimularBooks(
        category: widget.category,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimulatBookCubit, SimulatBookState>(
      builder: (context, state) {
        if (state is SimulatBookSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.push(Routes.bookview, extra: state.books[index]);
                },
                child: CustomSimularImage(
                  image:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              ),
            ),
          );
        } else if (state is SimulatBookFailure) {
          return CustomErorrFailure(failureMassage: state.erorrMassage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
