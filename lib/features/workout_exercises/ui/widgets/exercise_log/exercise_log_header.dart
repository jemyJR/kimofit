import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class ExerciseLogHeader extends StatelessWidget {
  const ExerciseLogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 70.h,
          color: ColorsManager.blue,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.dark,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.bgDark.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(-5, 0),
              ),
              BoxShadow(
                color: ColorsManager.bgDark.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(5, 0),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).exerciseLog,
                  style: TextStyles.font18White,
                ),
                Lottie.asset(
                  Assets.animationDumble,
                  width: 100.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
