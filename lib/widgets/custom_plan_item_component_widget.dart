import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomPlanItemComponentWidget extends StatelessWidget {
  final ItemModel? itemModel;

  const CustomPlanItemComponentWidget({super.key, this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: itemModel != null,
      maintainAnimation: true,
      maintainSize: true,
      maintainState: true,
      child: Container(
        padding: EdgeInsets.only(left: 8.w),
        decoration: BoxDecoration(
          color: ColorManager.kWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.kDateCircleBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.r),
              bottomLeft: Radius.circular(3.r),
              topRight: Radius.circular(7.r),
              bottomRight: Radius.circular(7.r),
            ),
          ),
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 12.h,
            right: 16.w,
            left: 10.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageWidget(
                imageAddress: AssetsIconAddress.kDragItemIcon,
                height: 22.h,
                width: 22.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            itemModel != null
                                ? itemModel!.itemTag == ItemTagEnum.armsWorkout
                                    ? ColorManager.kSelectedDateColor
                                        .withOpacity(0.40)
                                    : ColorManager.kPlaningActiveTagColor
                                        .withOpacity(0.40)
                                : ColorManager.kPlaningActiveTagColor
                                    .withOpacity(0.40),
                        borderRadius: BorderRadius.all(Radius.circular(3.r)),
                      ),
                      padding: EdgeInsets.all(4.sp),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageWidget(
                            imageAddress:
                                itemModel != null
                                    ? itemModel!.itemTag ==
                                            ItemTagEnum.armsWorkout
                                        ? AssetsIconAddress.kArmsWorkoutIcon
                                        : AssetsIconAddress.kLegWorkoutIcon
                                    : AssetsIconAddress.kLegWorkoutIcon,
                            height: 10.h,
                            width: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: CustomTextWidget(
                              text:
                                  itemModel != null
                                      ? itemModel!.itemTag ==
                                              ItemTagEnum.armsWorkout
                                          ? "Arms Workout"
                                          : "Leg Workout"
                                      : "Leg Workout",
                              fontColor:
                                  itemModel != null
                                      ? itemModel!.itemTag ==
                                              ItemTagEnum.armsWorkout
                                          ? ColorManager.kSelectedDateColor
                                          : ColorManager.kPlaningActiveTagColor
                                      : ColorManager.kPlaningActiveTagColor,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            text: itemModel != null ? itemModel!.title : "",
                            fontColor: ColorManager.kWhiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          CustomTextWidget(
                            text: itemModel != null ? itemModel!.subTitle : "",
                            fontColor: ColorManager.kWhiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
