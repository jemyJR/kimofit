import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/app_fonts.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

Decoration rotatedCornerBadgeDecoration({
  required String text,
  required Color color,
}) {
  return RotatedCornerDecoration.withColor(
    color: color,
    badgeSize: Size(75.w, 75.h),
    badgeCornerRadius: Radius.circular(10.r),
    badgePosition: BadgePosition.topStart,
    spanBaselineShift: 4,
    badgeShadow: const BadgeShadow(
      color: ColorsManager.black,
      elevation: 4,
    ),
    textSpan: TextSpan(
      text: text,
      style: TextStyles.font15White.copyWith(
        fontFamily: AppFonts.cairo,
      ),
    ),
  );
}
