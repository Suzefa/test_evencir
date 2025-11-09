import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomWorkoutTaskWidget extends StatelessWidget {
  const CustomWorkoutTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7.w,),
      decoration: BoxDecoration(
        color: ColorManager.kWorkoutHomeItemTagColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.kDateCircleBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2.r),
            bottomLeft: Radius.circular(2.r),
            topRight: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 24.w,),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: "December 22 - 25m - 30m",
                  fontColor: ColorManager.kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
                CustomTextWidget(
                  text: "Upper Body",
                  fontColor: ColorManager.kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ],
            ),
            const Spacer(),
            CustomImageWidget(
              imageAddress: AssetsIconAddress.kHomeWorkoutArrowNextIcon,
              color: ColorManager.kWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
