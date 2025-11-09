import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomCaloriesCounterWidget extends StatelessWidget {
  final int totalCalories;
  final int consumedCalories;

  const CustomCaloriesCounterWidget({
    super.key,
    required this.totalCalories,
    required this.consumedCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7.r),),
        color: ColorManager.kDateCircleBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: "${consumedCalories}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.kWhiteColor,
                      fontFamily: CustomThemeData.kMulishFonts,
                      fontSize: 40,
                    ),
                  ),
                  TextSpan(
                    text: "Calories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.kWhiteColor,
                      fontFamily: CustomThemeData.kMulishFonts,
                      fontSize: 18,
                    ),
                  ),
                ]
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h,bottom: 34.h,),
            child: CustomTextWidget(
              text: "${totalCalories-consumedCalories} Remaining",
              fontColor: ColorManager.kWhiteColor.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              alignment: Alignment.centerLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Row(
              children: [
                CustomTextWidget(
                  text: "0",
                  fontColor: ColorManager.kWhiteColor.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.centerLeft,
                ),
                const Spacer(),
                CustomTextWidget(
                  text: "$totalCalories",
                  fontColor: ColorManager.kWhiteColor.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          CustomLinearProgressBar(progress: consumedCalories/totalCalories),
        ],
      ),
    );
  }
}
