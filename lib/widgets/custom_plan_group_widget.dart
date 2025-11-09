import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomPlanGroupWidget extends StatelessWidget {
  final bool isActive;
  final String title;
  final String subTitle;
  final String description;

  const CustomPlanGroupWidget({
    super.key,
    required this.isActive,
    required this.title,
    required this.subTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: isActive ? ColorManager.kPlaningActiveTagColor : ColorManager.kPlaningDeActiveTagColor,
          height: 3.h,
          thickness: 5.sp,
        ),
        Container(
          padding: EdgeInsets.only(
            top: 16.h,
            right: 24.w,
            left: 24.w,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.kPlaningItemBackgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: CustomTextWidget(
                  text: title,
                  fontColor: ColorManager.kWhiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: subTitle,
                    fontColor: ColorManager.kPlaningItemSubtitleColor,
                    fontSize: 18.sp,
                    alignment: Alignment.centerLeft,
                  ),
                  const Spacer(),
                  CustomTextWidget(
                    text: description,
                    fontColor: ColorManager.kPlaningItemSubtitleColor,
                    fontSize: 18.sp,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
