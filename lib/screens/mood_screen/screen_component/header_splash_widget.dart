import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class HeaderSplashWidget extends StatelessWidget {
  const HeaderSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 378.w,
      height: 285.h,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Stack(
          children: [
            CustomPaint(
              painter: EllipseSplashPainter(
                  height: 100.h,
                  width: MediaQuery.sizeOf(context).width,
                  gradient: [
                    ColorManager.kSplashRadiusCyanColor.withOpacity(0.60),
                    ColorManager.kSplashRadiusCyanTransparentColor,
                  ],
                  radius: 500,
                  positionOfCenter: Offset(MediaQuery.sizeOf(context).width/2, 120)
              ),
              size: Size(MediaQuery.sizeOf(context).width, 100),
            ),
            CustomPaint(
              painter: EllipseSplashPainter(
                height: 245.h,
                width: 120.w,
                gradient: [
                  ColorManager.kSplashRadiusPurpleColor.withOpacity(0.60),
                  ColorManager.kSplashRadiusPurpleTransparentColor,
                ],
                radius: 150,
                positionOfCenter: Offset(MediaQuery.sizeOf(context).width/2, 120),
              ),
              size: const Size(120, 245),
            ),
          ],
        ),
      ),
    );
  }
}
