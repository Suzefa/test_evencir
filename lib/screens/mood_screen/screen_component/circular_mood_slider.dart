import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class CircularMoodSlider extends StatefulWidget {
  const CircularMoodSlider({super.key});

  @override
  State<CircularMoodSlider> createState() => _CircularMoodSliderState();
}

class _CircularMoodSliderState extends State<CircularMoodSlider> with SingleTickerProviderStateMixin {
  final controller = Get.find<MoodController>();
  late final AnimationController _controller;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;

  void _updateIconOnThumbMove(double newAngle) {
    double deg = (newAngle * 180 / pi + 360) % 360;
    int newIndex;
    if (deg >= 0 && deg <= 90) {
      newIndex = 0;
    } else if (deg > 90 && deg <= 180) {
      newIndex = 1;
    } else if (deg > 180 && deg <= 270) {
      newIndex = 2;
    } else {
      newIndex = 3;
    }
    if (newIndex != controller.currentIndex.value) {
      controller.nextIndex.value = newIndex;
      _controller.forward(from: 0).then((_) {
        controller.currentIndex.value = newIndex;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(curved);
    _scaleAnim = Tween<double>(begin: 0.8, end: 1).animate(curved);
    controller.thumbAngle.stream.listen(_updateIconOnThumbMove);
  }

  void _onPanUpdate(Offset localPosition, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;
    double newAngle = atan2(dy, dx);
    controller.thumbAngle.value = newAngle;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300.h,
        width: 300.w,
        child: GestureDetector(
          onPanUpdate: (dragUpdateDetails) {
            _onPanUpdate(dragUpdateDetails.localPosition, Size(300.w, 300.h));
          },
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 281.w,
                  height: 281.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black, // Inner fill color
                  ),
                  child: ShaderMask(
                    shaderCallback: (rect) => SweepGradient(
                      colors: [
                        ColorManager.kMoodSelectorFirstColor,
                        ColorManager.kMoodSelectorSecondColor,
                        ColorManager.kMoodSelectorThirdColor,
                        ColorManager.kMoodSelectorFourthColor,
                        ColorManager.kMoodSelectorFirstColor,
                      ],
                      stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                      startAngle: 0.0,
                      endAngle: 6.28319, // 2 * pi
                      tileMode: TileMode.mirror,
                    ).createShader(rect),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // dummy (shader replaces it)
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(() {
                return Transform.rotate(
                  angle: controller.thumbAngle.value,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 57.w,
                      height: 57.h,
                      decoration: BoxDecoration(
                        color: ColorManager.kMoodSliderThumbFillColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.kMoodSliderThumbStrokeColor,
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 1 - _fadeAnim.value,
                          child: Transform.scale(
                            scale: 1 - (_scaleAnim.value - 0.8),
                            child: Obx(() {
                              return CustomImageWidget(
                                imageAddress: controller.moods[controller.currentIndex.value],
                              );
                            }),
                          ),
                        ),
                        Opacity(
                          opacity: _fadeAnim.value,
                          child: Transform.scale(
                            scale: _scaleAnim.value,
                            child: Obx(() {
                              return CustomImageWidget(
                                imageAddress: controller.moods[controller.nextIndex.value],
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
