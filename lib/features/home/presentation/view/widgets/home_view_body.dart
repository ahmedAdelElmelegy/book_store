import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/utils/routes.dart';
import 'package:book_app/core/widgets/book_item.dart';
import 'package:book_app/core/widgets/custom_error_failure.dart';
import 'package:book_app/core/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/feature_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                const FeatureBookListView(),
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
                    (context, index) => BookItem(
                      books: books[index],
                      onTap: () {
                        context.push(Routes.bookview, extra: books[index]);
                      },
                    ),
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
