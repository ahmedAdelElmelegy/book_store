import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home/presentation/manager/FeaturesBooksDetailes/features_book_details_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookListView extends StatefulWidget {
  const FeatureBookListView({super.key});

  @override
  State<FeatureBookListView> createState() => _FeatureBookListViewState();
}

class _FeatureBookListViewState extends State<FeatureBookListView> {
  late ScrollController _scrollController;
  int nextPageNumber = 1;
  bool _isFetching = false; // to prevent multiple simultaneous calls

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FeaturesBookDetailsCubit>().fetchFeaturesBooks(
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
        await context.read<FeaturesBookDetailsCubit>().fetchFeaturesBooks(
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
    final size = MediaQuery.of(context).size;

    return BlocBuilder<FeaturesBookDetailsCubit, FeaturesBookDetailsState>(
      builder: (context, state) {
        final cubit = context.read<FeaturesBookDetailsCubit>();

        if (state is FeaturesBookDetailsFailure) {
          return CustomErorrFailure(failureMassage: state.erorrMassage);
        }

        if (state is FeaturesBookDetailsSucess || state is PagenationLoading) {
          return SizedBox(
            height: size.height * 0.33,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount:
                  cubit.bookList.length + (state is PagenationLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < cubit.bookList.length) {
                  final book = cubit.bookList[index];
                  if (book != null) {
                    return FeatureBookItem(books: book);
                  }
                  return const SizedBox();
                } else {
                  // Pagination loading indicator at the end
                  return const SizedBox(
                    width: 60,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          );
        }

        return const CustomLoadingIndicator();
      },
    );
  }
}
