import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class NoDataWidgetSmall extends StatelessWidget {
  const NoDataWidgetSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorsManager.dark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              Assets.animationNoData,
              width: 50.w,
              fit: BoxFit.contain,
              reverse: true,
              repeat: true,
            ),
            Text(
              S.of(context).noDataMessageSmall,
              style: TextStyles.font18White,
            ),
          ],
        ),
      ),
    );
  }
}
