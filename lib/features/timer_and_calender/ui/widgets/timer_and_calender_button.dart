import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:lottie/lottie.dart';

class TimerAndCalenderButton extends StatelessWidget {
  const TimerAndCalenderButton({super.key, required this.iconPath});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: ColorsManager.bgDark,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Lottie.asset(
            iconPath,
          ),
        ),
      ),
    );
  }
}
