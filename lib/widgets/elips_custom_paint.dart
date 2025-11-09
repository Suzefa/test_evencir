import 'package:flutter/material.dart';

class EllipseSplashPainter extends CustomPainter {
  final List<Color> gradient;
  final double height;
  final double width;
  final double radius;
  final Offset positionOfCenter;

  const EllipseSplashPainter({
    required this.height,
    required this.width,
    required this.gradient,
    required this.radius,
    required this.positionOfCenter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..shader = RadialGradient(
            colors: gradient,
            stops: [0.0, 1.0],
          ).createShader(
            Rect.fromCircle(center: positionOfCenter, radius: radius),
          )
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 90);

    canvas.drawOval(
      Rect.fromCenter(
        center: positionOfCenter,
        width: width,
        height: height,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
