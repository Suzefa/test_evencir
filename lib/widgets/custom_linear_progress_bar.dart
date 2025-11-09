import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomLinearProgressBar extends StatelessWidget {
  final double progress;

  const CustomLinearProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.kProgressBarBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.66, 1.0],
                  colors: [
                    Color(0xFF7BBDE2),
                    Color(0xFF69C0B1),
                    Color(0xFF60C198),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
