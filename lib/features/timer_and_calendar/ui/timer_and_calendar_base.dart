import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';

class TimerAndCalendarBase extends StatelessWidget {
  const TimerAndCalendarBase({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 115.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.dark,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
