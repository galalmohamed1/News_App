import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_color.dart';


class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.white,
      centerTitle: true,
      titleTextStyle: TextStyle(color: ColorPalette.primaryColor, fontSize: 18),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.primaryDarkColor,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.white,
        centerTitle: true,
        titleTextStyle:
        TextStyle(color: ColorPalette.primaryColor, fontSize: 18),
        iconTheme: IconThemeData(
          color: ColorPalette.primaryColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.primaryDarkColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorPalette.white,
      unselectedItemColor: ColorPalette.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: "Inter",
      ),
    ),
  );
}
