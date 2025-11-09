import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final bool isSelected;
  final String iconAddress;
  final String iconName;
  final VoidCallback? onTap;

  const CustomBottomNavBarItem({
    super.key,
    required this.isSelected,
    required this.iconAddress,
    required this.iconName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.kBottomNavigationBarBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageWidget(
              imageAddress: iconAddress,
              height: 24.sp,
              width: 24.sp,
              color: isSelected ? ColorManager.kWhiteColor : ColorManager.kBottomNavigationBarItemUnSelectColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: CustomTextWidget(
                text: iconName,
                fontSize: 14.sp,
                fontColor: isSelected ? ColorManager.kWhiteColor : ColorManager.kBottomNavigationBarItemUnSelectColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
