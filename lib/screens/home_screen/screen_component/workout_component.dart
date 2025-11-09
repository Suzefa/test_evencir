import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class WorkoutComponent extends StatelessWidget {
  const WorkoutComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        Row(
          children: [
            CustomTextWidget(
              text: "Workouts",
              fontColor: ColorManager.kWhiteColor,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
            ),
            Spacer(),
            Obx((){
              if(controller.isDayTime.value) {
                return CustomImageWidget(
                  imageAddress: AssetsIconAddress.kWeatherDayIcon,
                );
              }
              return CustomImageWidget(
                imageAddress: AssetsIconAddress.kWeatherNightIcon,
              );
            }),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: CustomTextWidget(
                text: "9\u00B0",
                fontColor: ColorManager.kWhiteColor,
                fontSize: 26.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h,bottom: 32.h,),
          child: CustomWorkoutTaskWidget(),
        ),
      ],
    );
  }
}
