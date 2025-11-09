import 'dart:async';

import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class HomeController extends GetxController {
  final DateFormatter dateFormatter = DateFormatter();
  final List<WeekDateModel> weekDays = <WeekDateModel>[];
  RxInt totalWeeks = 1.obs, currentWeek = 1.obs,waterML=0.obs;
  RxBool isWeekListUpdated = false.obs,isDayTime = false.obs;
  Rx<DateTime> selectedDateTime = Rx<DateTime>(DateTime.now());
  late final Timer timer;

  @override
  void onInit() {
    isDayTime.value = dateFormatter.isDayTime();
    timer = Timer.periodic(
      Duration(minutes: 1),
      (timer) {
        isDayTime.value = dateFormatter.isDayTime();
      },
    );
    super.onInit();
  }

  void getWeekDaysData({DateTime? dateTime}) {
    weekDays.clear();
    if(dateTime!= null) {
      selectedDateTime.value = dateTime;
    } else {
      final date = DateTime.now();
      selectedDateTime.value = date;
    }
    currentWeek.value = dateFormatter.getWeekNumber(selectedDateTime.value);
    totalWeeks.value = dateFormatter.getTotalWeeksInYear(selectedDateTime.value.year);
    weekDays.addAll(dateFormatter.getWeekDatesList(currentWeek.value, selectedDateTime.value.year,),);
    isWeekListUpdated.toggle();
  }

  void openCalenderView() {
    Get.find<DashBoardController>().openBottomSheet();
  }


  @override
  void dispose() {
    timer.cancel();
    Get.delete<HomeController>();
    super.dispose();
  }
}