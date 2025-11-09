import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomChartEntryWidget extends StatelessWidget {
  final bool isMidTracker;
  final bool showTitle;
  final String title;
  final String result;

  const CustomChartEntryWidget({
    super.key,
    this.isMidTracker=false,
    this.showTitle=false,
    required this.title,
    this.result = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context) {
            if(isMidTracker) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Container(
                      width: 10.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: isMidTracker ? ColorManager.kHydrationPercentageColor.withOpacity(0.30): ColorManager.kHydrationPercentageColor,
                        borderRadius: BorderRadius.all(Radius.circular(7.r)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 38.w),
                    child: Visibility(
                      visible: false,
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      child: Container(
                        height: 2.h,
                        width: 107.w,
                        decoration: BoxDecoration(
                          color: ColorManager.kHydrationPercentageTrackerColor,
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
        Row(
          children: [
            Visibility(
              visible: !isMidTracker,
              child: Builder(
                builder: (context) {
                  if(!showTitle) {
                    return SizedBox.shrink();
                  }
                  return CustomTextWidget(
                    text: title,
                    fontColor: ColorManager.kWhiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  );
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Container(
                width: 10.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: isMidTracker ? ColorManager.kHydrationPercentageColor.withOpacity(0.30): ColorManager.kHydrationPercentageColor,
                  borderRadius: BorderRadius.all(Radius.circular(7.r)),
                ),
              ),
            ),
            Visibility(
              visible: result.isNotEmpty,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Container(
                height: 2.h,
                width: 107.w,
                decoration: BoxDecoration(
                  color: ColorManager.kHydrationPercentageTrackerColor,
                  borderRadius: BorderRadius.all(Radius.circular(7.r)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: 40.w,
              height: 30.h,
              child: Visibility(
                visible: result.isNotEmpty,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                child: FittedBox(
                  child: CustomTextWidget(
                    text: result.isEmpty ? "0ml" : result,
                    fontColor: ColorManager.kWhiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        Builder(
          builder: (context) {
            if(isMidTracker) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Container(
                      width: 10.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: isMidTracker ? ColorManager.kHydrationPercentageColor.withOpacity(0.30): ColorManager.kHydrationPercentageColor,
                        borderRadius: BorderRadius.all(Radius.circular(7.r)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 38.w),
                    child: Visibility(
                      visible: false,
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      child: Container(
                        height: 2.h,
                        width: 107.w,
                        decoration: BoxDecoration(
                          color: ColorManager.kHydrationPercentageTrackerColor,
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
