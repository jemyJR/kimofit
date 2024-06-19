import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key, required this.percent});
  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 25.h,
      percent: percent / 100,
      center: Text(
        '${percent.toInt()}%',
        style: TextStyles.font15White,
      ),
      backgroundColor: ColorsManager.gray.withOpacity(0.2),
      progressColor: ColorsManager.blue,
      barRadius: Radius.circular(10.r),
      animation: true,
      animationDuration: 1000,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
    );
  }
}
