import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screenController = Get.find<HomeController>();

  @override
  void initState() {
    screenController.getWeekDaysData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.kTransparentColor,
        surfaceTintColor: ColorManager.kTransparentColor,
        leading: Center(
          child: CustomImageWidget(
            imageAddress: AssetsIconAddress.kNotificationIcon,
            height: 24.h,
            width: 24.w,
          ),
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: screenController.openCalenderView,
          child: Container(
            color: ColorManager.kBlackColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageWidget(
                  imageAddress: AssetsIconAddress.kWeekIcon,
                  height: 20.h,
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w,),
                  child: Obx(() {
                    return CustomTextWidget(
                      text: "Week ${screenController.currentWeek.value}/${screenController.totalWeeks.value}",
                      fontColor: ColorManager.kWhiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    );
                  }),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: ColorManager.kWhiteColor,
                  size: 35.sp,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalenderComponent(),
              WorkoutComponent(),
              CustomTextWidget(
                text: "My Insights",
                fontColor: ColorManager.kWhiteColor,
                fontSize: 26.sp,
                fontWeight: FontWeight.w700,
                alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h,),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCaloriesCounterWidget(
                        totalCalories: 2500,
                        consumedCalories: 550,
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    Expanded(child: CustomWeightTellyWidget()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: CustomHydrationTrackerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    screenController.dispose();
    super.dispose();
  }
}
