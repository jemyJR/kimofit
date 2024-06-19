import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:lottie/lottie.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle(
      {super.key, required this.iconPath, required this.borderColor});
  final String iconPath;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      decoration: BoxDecoration(
        color: borderColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: Container(
          decoration: const BoxDecoration(
            color: ColorsManager.blue,
            shape: BoxShape.circle,
          ),
          child: Lottie.asset(
            iconPath,
            repeat: false,
          ),
        ),
      ),
    );
  }
}
