import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class DashBoardController extends GetxController {
  final GlobalKey<ScaffoldState> screenKey = GlobalKey<ScaffoldState>();
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    if(currentIndex.value == index) return;
    currentIndex.value = index;
  }

  void openBottomSheet() {
    showModalBottomSheet(
      context: screenKey.currentContext!,
      backgroundColor: ColorManager.kDateCircleBackgroundColor,
      isScrollControlled: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: 16.h,bottom: 26.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5.h,
                width: 58.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: ColorManager.kBottomSheetControllerColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h,left: 10.w,right: 10.w,),
                child: CustomTableCalendarView(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<DashBoardController>();
    super.dispose();
  }
}