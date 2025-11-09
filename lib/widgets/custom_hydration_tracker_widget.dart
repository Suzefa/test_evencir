import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomHydrationTrackerWidget extends StatelessWidget {
  const CustomHydrationTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 14.h, left: 14.h, right: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.r),
              topRight: Radius.circular(7.r),
            ),
            color: ColorManager.kDateCircleBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return CustomTextWidget(
                      text: "${(controller.waterML.value / 2000) * 100}%",
                      fontColor: ColorManager.kHydrationPercentageColor,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                      alignment: Alignment.centerLeft,
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 43.h),
                    child: CustomTextWidget(
                      text: "Hydration",
                      fontColor: ColorManager.kWhiteColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h, bottom: 13.h),
                    child: CustomTextWidget(
                      text: "Log Now",
                      fontColor: ColorManager.kWhiteColor.withOpacity(0.5),
                      fontSize: 12.sp,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() {
                    return CustomChartEntryWidget(
                      title: "2L",
                      showTitle: true,
                      result: controller.waterML.value == 2000 ? "2L" : "",
                    );
                  }),
                  Obx(() {
                    return CustomChartEntryWidget(
                      isMidTracker: true,
                      title: '',
                      result: controller.waterML.value == 1500 ? "1.5L" : "",
                    );
                  }),
                  Obx(() {
                    return CustomChartEntryWidget(
                      title: "",
                      result: controller.waterML.value == 1000 ? "1L" : "",
                    );
                  }),
                  Obx(() {
                    return CustomChartEntryWidget(
                      isMidTracker: true,
                      title: '',
                      result: controller.waterML.value == 500 ? "0.5L" : "",
                    );
                  }),
                  Obx(() {
                    return CustomChartEntryWidget(
                      title: "0L",
                      showTitle: true,
                      result: controller.waterML.value == 0 ? "0ml" : "",
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (controller.waterML.value == 2000) return;
            controller.waterML.value = controller.waterML.value + 500;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7.r),
                bottomRight: Radius.circular(7.r),
              ),
              color: ColorManager.kHydrationButtonColorColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 13.5.h),
            child: Center(
              child: CustomTextWidget(
                text: "500 ml added to water log",
                fontColor: ColorManager.kWhiteColor,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
