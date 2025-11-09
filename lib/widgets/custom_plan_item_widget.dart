import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomPlanItemWidget extends StatelessWidget {
  final ItemModel? itemModel;
  final DateTime dateTime;

  const CustomPlanItemWidget({
    super.key,
    this.itemModel,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlanController>();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: ColorManager.kBlackColor),
          child: Row(
            children: [
              Container(
                width: 60.w,
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: DateFormatter().getDayName(dateTime),
                      fontColor:
                          itemModel != null
                              ? ColorManager.kWhiteColor
                              : ColorManager.kPlanScreenDividerColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: "${dateTime.day}",
                      fontColor:
                          itemModel != null
                              ? ColorManager.kWhiteColor
                              : ColorManager.kPlanScreenDividerColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LongPressDraggable<ItemModel>(
                  data: itemModel,
                  feedback: Material(
                    color: ColorManager.kTransparentColor,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width-110.w,
                      child: CustomPlanItemComponentWidget(
                        itemModel: itemModel,
                      ),
                    ),
                  ),
                  childWhenDragging: CustomPlanItemComponentWidget(),
                  onDragStarted: () => controller.draggedItem = itemModel,
                  onDraggableCanceled: (_, __) => controller.draggedItem = null,
                  onDragEnd: (_) => controller.draggedItem = null,
                  child: CustomPlanItemComponentWidget(itemModel: itemModel),
                ),
              ),
            ],
          ),
        ),
        Divider(color: ColorManager.kPlanScreenDividerColor, thickness: 1.5),
      ],
    );
  }
}
