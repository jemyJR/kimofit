import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/app_fonts.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class RestDayWidget extends StatelessWidget {
  const RestDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.animationRestDayPeople,
              width: 250.w,
              fit: BoxFit.contain,
              reverse: true,
              repeat: true,
            ),
            Text(
              S.of(context).restDay,
              style: TextStyles.font32BoldWhite.copyWith(
                fontFamily: AppFonts.lemonada,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),
            Text(
              S.of(context).restDayMessage,
              style: TextStyles.font18White,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
