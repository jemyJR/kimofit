import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';

class ArrowSliderButton extends StatelessWidget {
  const ArrowSliderButton({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: ColorsManager.blue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Icon(
            icon,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}
