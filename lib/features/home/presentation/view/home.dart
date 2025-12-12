import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/utils/routes.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_action_buttom.dart';
import 'package:book_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text('BookStore', style: AppStyle.f24UrbanistBold),
        centerTitle: true,
        actions: [
          CustomActionButtom(
            onPressed: () {
              GoRouter.of(context).push(Routes.search);
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
