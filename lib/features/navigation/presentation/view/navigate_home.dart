import 'package:book_app/core/utils/app_color.dart';
import 'package:book_app/features/navigation/presentation/manager/cubit/navigat_betwen_screen_cubit.dart';
import 'package:book_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigateHome extends StatelessWidget {
  const NavigateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatBetwenScreenCubit, NavigatBetwenScreenState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<NavigatBetwenScreenCubit>(context);
        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var cubits = BlocProvider.of<ProfileCubit>(context);
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                backgroundColor: cubits.darktheme
                    ? AppColor.darkScaffoldColor
                    : AppColor.lightScaffoldColor,
                destinations: cubit.items,
                onDestinationSelected: (value) {
                  cubit.navigation(value);
                },
                selectedIndex: cubit.currentIndex,
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          },
        );
      },
    );
  }
}
