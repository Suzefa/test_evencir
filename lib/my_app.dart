import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(439, 956),
      builder: (context,child) {
        return child!;
      },
      child: MaterialApp(
        title: 'Test EvenCir',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.kInitialRouteName,
        onGenerateRoute: RouteGenerator.generate,
        navigatorKey: RouteGenerator.navigationKey,
        theme: CustomThemeData.kNormalTheme(),
      ),
    );
  }
}
