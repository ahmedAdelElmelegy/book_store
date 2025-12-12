import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/features/profile/presentation/view/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: 25,
              backgroundImage: const AssetImage(
                Assets.imagesAppbarShoppingCart,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .05),
            Text('Profile', style: AppStyle.f24UrbanistBold),
          ],
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
