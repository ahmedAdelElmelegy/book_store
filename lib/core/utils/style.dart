import 'package:book_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(
      {required bool isDark, required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDark ? AppColor.darkScaffoldColor : AppColor.lightScaffoldColor,
        cardColor: isDark ? AppColor.darkCard : AppColor.lightCard,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: isDark ? AppColor.colorTextdark : AppColor.colorTextLight,
            ),
            elevation: 0,
            backgroundColor: isDark
                ? AppColor.darkScaffoldColor
                : AppColor.lightScaffoldColor,
            titleTextStyle: TextStyle(
                color:
                    isDark ? AppColor.colorTextdark : AppColor.colorTextLight)),
        brightness: isDark ? Brightness.dark : Brightness.light);
  }
}
