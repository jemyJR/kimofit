import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class TitleFormOfExercise extends StatelessWidget {
  const TitleFormOfExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset(
          Assets.animationLightning,
          height: 30.h,
          width: 30.w,
        ),
        Container(
          height: 30.h,
          decoration: BoxDecoration(
            color: ColorsManager.dark,
            border: Border.all(color: ColorsManager.blue),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              S.of(context).superSet,
              style: TextStyles.font15BlueBold,
            ),
          ),
        ),
        Lottie.asset(
          Assets.animationLightning,
          height: 30.h,
          width: 30.w,
        ),
      ],
    );
  }
}
