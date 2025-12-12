import 'package:book_app/core/di/injection.dart';
import 'package:book_app/features/navigation/presentation/view/navigate_home.dart';
import 'package:book_app/features/Splash/presentation/view/splash_view.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/Simularbook/simulat_book_cubit.dart';
import 'package:book_app/features/home/presentation/view/home.dart';
import 'package:book_app/features/home/presentation/view/book_detail.dart';
import 'package:book_app/features/home/presentation/view/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/NavigateHome',
      builder: (context, state) => const NavigateHome(),
    ),
    GoRoute(path: '/search', builder: (context, state) => SearchPage()),
    GoRoute(
      path: '/bookview',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SimulatBookCubit>(), // كل مرة instance جديد
        child: BookDetailScreen(books: state.extra as BookModel),
      ),
    ),
  ],
);
