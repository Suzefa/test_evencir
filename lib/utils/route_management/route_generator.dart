import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class RouteGenerator {
  RouteGenerator._();

  static final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? generate(RouteSettings settings) {
    switch(settings.name) {
      case RouteNames.kInitialRouteName:
        return MaterialPageRoute(
          builder: (context) {
            //screen name Should appear here
            Get.put(DashBoardController());
            return DashBoardScreen();
          },
          settings: settings,
        );
      default:
        return null;
    }
  }
}