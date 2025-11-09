import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomWeightTellyWidget extends StatelessWidget {
  const CustomWeightTellyWidget({super.key});

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
                  text: "75",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.kWhiteColor,
                    fontFamily: CustomThemeData.kMulishFonts,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: "kg",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.kWhiteColor,
                    fontFamily: CustomThemeData.kMulishFonts,
                    fontSize: 16,
                  ),
                ),
              ]
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h,bottom: 38.h,),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 4.w,),
                  child: CustomImageWidget(
                    imageAddress: AssetsIconAddress.kWeightGainIcon,
                  ),
                ),
                CustomTextWidget(
                  text: "+1.6kg",
                  fontColor: ColorManager.kWhiteColor.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          CustomTextWidget(
            text: "Weight",
            fontColor: ColorManager.kWhiteColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
