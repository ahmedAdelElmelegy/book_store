import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home/presentation/manager/FeaturesBooksDetailes/features_book_details_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookImageListview extends StatefulWidget {
  const CustomBookImageListview({super.key});

  @override
  State<CustomBookImageListview> createState() =>
      _CustomBookImageListviewState();
}

class _CustomBookImageListviewState extends State<CustomBookImageListview> {
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
      context.read<FeaturesBookDetailsCubit>().fetchFeaturesBooks(
        pageNumber: nextPagenumber++,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FeaturesBookDetailsCubit, FeaturesBookDetailsState>(
      builder: (context, state) {
        final cubit = context.read<FeaturesBookDetailsCubit>();
        if (state is FeaturesBookDetailsFailure) {
          return CustomErorrFailure(failureMassage: state.erorrMassage);
        } else if (state is FeaturesBookDetailsSucess ||
            state is PagenationLoading) {
          return SizedBox(
            height: size.height * .33,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: cubit.bookList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  CustomBookImageListItem(books: cubit.bookList[index]),
            ),
          );
        }

        return const CustomLoadingIndicator();
      },
    );
  }
}
