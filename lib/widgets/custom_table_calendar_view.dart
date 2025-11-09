import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomTableCalendarView extends StatelessWidget {
  const CustomTableCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      return TableCalendar(
        focusedDay: controller.selectedDateTime.value,
        firstDay: DateTime(2025, 1, 1),
        lastDay: DateTime(2025, 12, 31),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: ColorManager.kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
          weekendStyle: TextStyle(
            color: ColorManager.kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          titleTextFormatter: (date,dyn) {
            return DateFormatter().formatMonthName(date);
          },
          titleCentered: true,
          formatButtonShowsNext: false,
          formatButtonVisible: false,
          leftChevronIcon: Icon(Icons.chevron_left,color: ColorManager.kWhiteColor,),
          rightChevronIcon: Icon(Icons.chevron_right,color: ColorManager.kWhiteColor,),
        ),
        onDaySelected: (selectDate,focusDate) {
          controller.getWeekDaysData(dateTime: selectDate,);
        },
        selectedDayPredicate: (day) =>
            isSameDay(controller.selectedDateTime.value, day),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          weekendTextStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.kWhiteColor,
          ),
          defaultTextStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.kWhiteColor,
          ),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color:  ColorManager.kSelectedDateColor.withOpacity(0.16),
            border: Border.all(
              color:  ColorManager.kSelectedDateColor,
              width: 2.sp,
            ),
          ),
          selectedTextStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.kWhiteColor,
          ),
        ),
      );
    });
  }
}
