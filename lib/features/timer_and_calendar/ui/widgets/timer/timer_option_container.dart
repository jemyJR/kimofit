import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';

class TimerOptionContainer extends StatelessWidget {
  const TimerOptionContainer({
    super.key,
    required this.duration,
    required this.onTap,
  });
  final String duration;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 35.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: ColorsManager.blue,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          duration,
          style: TextStyles.font15White,
        ),
      ),
    );
  }
}
