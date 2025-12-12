import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slideAnim();
    animationController.forward();
    navigationToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [Image.asset(Assets.logo2, width: 100, height: 100)],
    );
  }

  Future<void> navigationToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      GoRouter.of(context).push(Routes.navigateHome);
    }
  }

  Animation<Offset> slideAnim() {
    return slideAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
  }
}
