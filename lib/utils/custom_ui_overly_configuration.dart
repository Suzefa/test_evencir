import 'package:flutter/services.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomUIOverlayConfiguration {
  CustomUIOverlayConfiguration._();

  static void setDefault() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.kTransparentColor,
        systemNavigationBarDividerColor: ColorManager.kNavigationDividerColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: ColorManager.kTransparentColor,
      ),
    );
  }
}