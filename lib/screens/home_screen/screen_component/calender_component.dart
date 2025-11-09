import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class CalenderComponent extends StatelessWidget {
  const CalenderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        Obx(() {
          return CustomTextWidget(
            text: controller.dateFormatter.formatDate(
              controller.selectedDateTime.value,
            ),
            fontColor: ColorManager.kWhiteColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            alignment: Alignment.centerLeft,
          );
        }),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Obx(() {
            controller.isWeekListUpdated.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(WeekDateModel data in controller.weekDays)
                  Obx(() {
                    return CustomWeekItem(
                      dateTime: data,
                      selectedDateTime: controller.selectedDateTime.value,
                      onTap: (DateTime date) {
                        controller.selectedDateTime.value = date;
                      },
                    );
                  }),
              ],
            );
          }),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 14.h,bottom: 22.h,),
            child: Container(
              height: 5.h,
              width: 58.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                color: ColorManager.kHomeScreenPillDividerColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
