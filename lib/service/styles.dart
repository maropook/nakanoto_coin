import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const int _primaryValue = 0xFFFE9E9A;
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );

  static const Color primaryColor = Color(0xFFFE9E9A);
  static const Color primaryColor700 = Color.fromARGB(255, 255, 209, 207);
  static const Color myButtonColor = Color.fromARGB(255, 253, 234, 234);
  static const Color secondaryColor = Color(0xFF594A31);
  static const Color secondaryColor900 = Color(0xFF594A31);
  static const Color pageBackground = Color(0xFFFFFFFF);
  static const Color appBarTitleColor = pageBackground;
  static const Color commonTextColor = Color(0xFF594A31);

  static AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: Styles.primaryColor,
    iconTheme: const IconThemeData(
      color: Styles.appBarTitleColor,
    ),
    titleTextStyle: GoogleFonts.mPlusRounded1c(
      textStyle: const TextStyle(
        fontSize: 25,
      ),
    ),
  );
  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 59,
      height: 1.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: Styles.commonTextColor,
    ),
    headline2: TextStyle(
        fontSize: 24,
        height: 1.48,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: Styles.commonTextColor),
    headline3: TextStyle(
      fontSize: 17,
      height: 1.48,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: Styles.commonTextColor,
    ),
    headline4: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: Styles.commonTextColor,
    ),
    headline5: TextStyle(
      fontSize: 14,
      height: 1.48,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: Styles.commonTextColor,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      height: 1.57,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: Styles.commonTextColor,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      height: 1.44,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: Styles.commonTextColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: Styles.commonTextColor,
    ),
    button: TextStyle(
      fontSize: 16,
      height: 1.13,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: Styles.commonTextColor,
    ),
    caption: TextStyle(
      fontSize: 8,
      height: 1.48,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: Styles.commonTextColor,
    ),
    overline: TextStyle(
      fontSize: 9,
      height: 1.48,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: Styles.commonTextColor,
    ),
  );
}
