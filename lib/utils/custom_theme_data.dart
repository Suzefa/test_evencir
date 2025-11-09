import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomThemeData {
  CustomThemeData._();

  static const String kMulishFonts = "Mulish";

  static ThemeData kNormalTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorManager.kBlackColor,
      fontFamily: kMulishFonts,
      textTheme: TextTheme(
        bodyMedium: kBodyTextStyle(),
        labelLarge: kButtonTextStyle(),
      ),
      splashColor: ColorManager.kTransparentColor,
    );
  }

  static TextStyle kTitleTextStyle() {
    return TextStyle(
      color: ColorManager.kWhiteColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle kBodyTextStyle() {
    return TextStyle(
      color: ColorManager.kWhiteColor,
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle kButtonTextStyle() {
    return TextStyle(
      color: ColorManager.kWhiteColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    );
  }
}