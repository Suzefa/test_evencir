import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final screenController = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: screenController.screenKey,
      body: Obx(() {
        if(screenController.currentIndex.value == 0) {
          Get.put(HomeController());
          return HomeScreen();
        } else if(screenController.currentIndex.value == 1) {
          Get.put(PlanController());
          return PlanScreen();
        } else if(screenController.currentIndex.value == 2) {
          Get.put(MoodController());
          return MoodScreen();
        } else if(screenController.currentIndex.value == 3) {
          return Center(
            child: CustomTextWidget(
              text: "Profile Screen", fontColor: ColorManager.kWhiteColor,
            ),
          );
        }
        return SizedBox.shrink();
      }),
      bottomNavigationBar: Container(
        constraints: BoxConstraints(
          maxHeight: 100.h,
        ),
        decoration: BoxDecoration(
          color: ColorManager.kBottomNavigationBarBackgroundColor,
        ),
        padding: EdgeInsets.only(top: 12.h,bottom: 12.h,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return CustomBottomNavBarItem(
                isSelected: screenController.currentIndex.value == 0,
                iconAddress: AssetsIconAddress.kNavigationNutritionBarIcon,
                iconName: "Nutrition",
                onTap: () {
                  screenController.changeIndex(0);
                },
              );
            }),
            Obx(() {
              return CustomBottomNavBarItem(
                isSelected: screenController.currentIndex.value == 1,
                iconAddress: AssetsIconAddress.kNavigationBarPlanIcon,
                iconName: "Plan",
                onTap: () {
                  screenController.changeIndex(1);
                },
              );
            }),
            Obx(() {
              return CustomBottomNavBarItem(
                isSelected: screenController.currentIndex.value == 2,
                iconAddress: AssetsIconAddress.kNavigationBarMoodIcon,
                iconName: "Mood",
                onTap: () {
                  screenController.changeIndex(2);
                },
              );
            }),
            Obx(() {
              return CustomBottomNavBarItem(
                isSelected: screenController.currentIndex.value == 3,
                iconAddress: AssetsIconAddress.kNavigationBarProfileIcon,
                iconName: "Profile",
                onTap: () {
                  screenController.changeIndex(3);
                },
              );
            }),
          ],
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
