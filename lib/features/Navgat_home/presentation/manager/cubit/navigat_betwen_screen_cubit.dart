import 'package:bloc/bloc.dart';
import 'package:book_app/features/Science/presentation/view/science_view.dart';
import 'package:book_app/features/home/presentation/view/home.dart';
import 'package:book_app/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

part 'navigat_betwen_screen_state.dart';

class NavigatBetwenScreenCubit extends Cubit<NavigatBetwenScreenState> {
  NavigatBetwenScreenCubit() : super(NavigatBetwenScreenInitial());
  int currentIndex = 0;
  void navigation(int index) {
    currentIndex = index;
    emit(NavigatBetwenScreenSucess());
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryView(category: 'Programming'),
    CategoryView(category: 'Science'),
    CategoryView(category: 'Sport'),

    ProfileView(),
  ];
  List<NavigationDestination> items = const [
    NavigationDestination(
      icon: Icon(IconlyLight.home),
      selectedIcon: Icon(IconlyBold.home),
      label: 'home',
    ),
    NavigationDestination(
      icon: Icon(Icons.computer),
      selectedIcon: Icon(Icons.computer),
      label: 'Programing',
    ),
    NavigationDestination(
      icon: Icon(Icons.science),
      selectedIcon: Icon(Icons.science),
      label: 'Scinece',
    ),
    NavigationDestination(
      icon: Icon(Icons.sports),
      selectedIcon: Icon(Icons.sports),
      label: 'Sport',
    ),
    NavigationDestination(
      icon: Icon(IconlyLight.profile),
      selectedIcon: Icon(IconlyBold.profile),
      label: 'Profile',
    ),
  ];

  // ];
}
