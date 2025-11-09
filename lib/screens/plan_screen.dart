import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final controller = Get.find<PlanController>();

  @override
  void initState() {
    controller.getWeekDaysData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.kTransparentColor,
        surfaceTintColor: ColorManager.kTransparentColor,
        title: CustomTextWidget(
          text: "Training Calendar",
          fontColor: ColorManager.kWhiteColor,
          fontSize: 24.sp,
          alignment: Alignment.centerLeft,
        ),
        actionsPadding: EdgeInsets.only(right: 24.w),
        actions: [
          CustomTextWidget(
            text: "Save",
            fontColor: ColorManager.kWhiteColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
      body: ListView(
        children: [
          CustomPlanGroupWidget(
            isActive: true,
            title: "Week 2/8",
            subTitle: "December 8-14",
            description: "Total: 60min",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Obx(() {
              controller.isWeekDaysListUpdated.value;
              return ListView.separated(
                itemCount: controller.selectedWeekDays.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index) {
                  return DragTarget<ItemModel>(
                    onAcceptWithDetails: (dragTargetDetails) {
                      if(controller.selectedWeekDays[index].itemModel!=null) return;
                      final item = dragTargetDetails.data;
                      int indexValue = controller.selectedWeekDays.indexWhere((test) => test.dateTime==item.dateTime);
                      if(indexValue!=-1) {
                        controller.selectedWeekDays[indexValue].itemModel = null;
                      }
                      item.dateTime = controller.selectedWeekDays[index].dateTime;
                      controller.selectedWeekDays[index].itemModel = item;
                      controller.isDragUpdate.toggle();
                      controller.isWeekDaysListUpdated.toggle();
                    },
                    builder: (context, candidateData, rejectData) {
                      return CustomPlanItemWidget(
                        dateTime: DateTime.parse(controller.selectedWeekDays[index].dateTime),
                        itemModel: controller.selectedWeekDays[index].itemModel,
                      );
                    },
                  );
                },
                separatorBuilder: (context,index) {
                  return SizedBox(height: 10.h,);
                },
              );
            }),
          ),
          CustomPlanGroupWidget(
            isActive: false,
            title: "Week 2",
            subTitle: "December 14-22",
            description: "Total: 60min",
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
