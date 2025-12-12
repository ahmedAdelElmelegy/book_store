import 'package:book_app/core/utils/services_locator.dart';
import 'package:book_app/features/Navgat_home/presentation/manager/cubit/navigat_betwen_screen_cubit.dart';

import 'package:book_app/features/home/data/Repo/home_repo_imp.dart';
import 'package:book_app/features/home/presentation/manager/FeaturesBooksDetailes/features_book_details_cubit.dart';
import 'package:book_app/features/home/presentation/manager/NewsetBookDetailes/newset_book_detiles_cubit.dart';
import 'package:book_app/features/home/presentation/manager/category_book/categorybook_cubit.dart';
import 'package:book_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;
  const GenerateMultiBloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigatBetwenScreenCubit()),
        BlocProvider(create: (context) => ProfileCubit()..getTheme()),
        BlocProvider(
          create: (context) =>
              FeaturesBookDetailsCubit(getIt.get<HomeRepoImpl>())
                ..fetchFeaturesBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewsetBookDetilesCubit(getIt.get<HomeRepoImpl>())
                ..fetchNewsetBooks(),
        ),

        BlocProvider(
          create: (context) => CategorybookCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: child,
    );
  }
}
