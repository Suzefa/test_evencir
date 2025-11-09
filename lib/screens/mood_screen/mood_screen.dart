import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  final controller = Get.find<MoodController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -55.0,
          left: 0.0,
          right: 0.0,
          child: HeaderSplashWidget(),
        ),
        Scaffold(
          backgroundColor: ColorManager.kTransparentColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 68.h, left: 24.w, bottom: 16.h),
                child: CustomTextWidget(
                  text: "Mood",
                  fontColor: ColorManager.kWhiteColor,
                  alignment: Alignment.centerLeft,
                  fontSize: 32.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 40.w),
                child: CustomTextWidget(
                  text: "Start your day",
                  fontColor: ColorManager.kWhiteColor,
                  alignment: Alignment.centerLeft,
                  fontSize: 18.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12.h,
                  left: 40.w,
                  right: 40.w,
                  bottom: 22.h,
                ),
                child: CustomTextWidget(
                  text: "How are you feeling at the Moment?",
                  fontColor: ColorManager.kWhiteColor,
                  alignment: Alignment.centerLeft,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              const CircularMoodSlider(),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Obx(() {
                  return CustomTextWidget(
                    text: controller.moodLabels[controller.currentIndex.value],
                    fontColor: ColorManager.kWhiteColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  );
                }),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CustomTextWidget(
                      text: "Continue",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
