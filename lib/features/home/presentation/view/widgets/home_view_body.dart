import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_book_image_listview.dart';
import 'package:book_app/features/home/presentation/view/widgets/book_listview_newst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Books', style: AppStyle.f18UrbanistBold),
                SizedBox(height: size.height * .02),
                const CustomBookImageListview(),
                SizedBox(height: size.height * .02),
                Text('See Alsho', style: AppStyle.f16UrbanistBold),
                SizedBox(height: size.height * .02),
              ],
            ),
          ),
        ),
        BlocBuilder<NewsetBookDetilesCubit, NewsetBookDetilesState>(
          builder: (context, state) {
            final books = context.read<NewsetBookDetilesCubit>().books;
            if (state is NewsetBookDetilesSucess) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        CustomNewBookListItem(books: books[index]),
                    childCount: books.length,
                  ),
                ),
              );
            } else if (state is NewsetBookDetilesFailed) {
              return SliverToBoxAdapter(
                child: CustomErorrFailure(failureMassage: state.erorrMassage),
              );
            }
            return SliverToBoxAdapter(child: CustomLoadingIndicator());
          },
        ),
      ],
    );
  }
}
