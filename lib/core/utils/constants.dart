import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/utils/profile_model.dart';

abstract class Constant {
  static List<ProfileModel> items = [
    ProfileModel(title: 'All Order', image: Assets.imagesProfileOrderSvg),
    ProfileModel(title: 'Wish List', image: Assets.imagesProfileWishlistSvg),
    ProfileModel(title: 'Viewed recently', image: Assets.imagesProfileRecent),
    ProfileModel(title: 'Adress', image: Assets.imagesProfileAddress),
  ];
}
