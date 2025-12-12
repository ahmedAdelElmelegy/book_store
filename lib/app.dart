import 'package:book_app/bloc.dart';
import 'package:book_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GenerateMultiBloc(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ProfileCubit>(context);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: Style.themeData(isDark: cubit.darktheme, context: context),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
