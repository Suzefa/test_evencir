import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomWeekItem extends StatelessWidget {
  final DateTime selectedDateTime;
  final WeekDateModel dateTime;
  final ValueChanged<DateTime>? onTap;

  const CustomWeekItem({
    super.key,
    required this.dateTime,
    required this.selectedDateTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(dateTime.dateTime);
    return Column(
      children: [
        CustomTextWidget(
          text: dateTime.dayInitial,
          fontColor: ColorManager.kWhiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: GestureDetector(
            onTap: () {
              if(onTap!=null) {
                onTap!(date);
              }
            },
            child: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: date.day == selectedDateTime.day
                        ? ColorManager.kSelectedDateColor.withOpacity(0.19)
                        : ColorManager.kDateCircleBackgroundColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: date.day == selectedDateTime.day
                      ? ColorManager.kSelectedDateColor
                      : ColorManager.kDateCircleBackgroundColor,
                  width: 2.sp,
                ),
              ),
              child: CustomTextWidget(
                text: "${date.day}",
                fontColor: ColorManager.kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Container(
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: date.day == selectedDateTime.day
                  ? ColorManager.kSelectedDateColor
                  : ColorManager.kBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
