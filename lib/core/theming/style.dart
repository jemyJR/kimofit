import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/app_fonts.dart';
import 'package:kimofit/core/constants/colors.dart';

class TextStyles {
  //! Regular
  static TextStyle font12White = TextStyle(
    fontSize: 12.sp,
    color: ColorsManager.white,
  );
  static TextStyle font13White = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.white,
  );
  static TextStyle font15White = TextStyle(
    fontSize: 15.sp,
    color: ColorsManager.white,
  );
  static TextStyle font15Blue = TextStyle(
    fontSize: 15.sp,
    color: ColorsManager.blue,
  );
  static TextStyle font18White = TextStyle(
    fontFamily: AppFonts.cairo,
    fontSize: 18.sp,
    color: ColorsManager.white,
  );

  static TextStyle font18Gray = TextStyle(
    fontFamily: AppFonts.cairo,
    fontSize: 18.sp,
    color: ColorsManager.gray,
  );
  static TextStyle font22White = TextStyle(
    fontSize: 22.sp,
    color: ColorsManager.white,
  );
  static TextStyle font22Blue = TextStyle(
    fontSize: 22.sp,
    color: ColorsManager.blue,
  );

  //! Bold
  static TextStyle font15BlueBold = TextStyle(
    fontSize: 15.sp,
    color: ColorsManager.blue,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18WhiteBold = TextStyle(
    fontFamily: AppFonts.cairo,
    fontSize: 18.sp,
    color: ColorsManager.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18BlueBold = TextStyle(
    fontFamily: AppFonts.cairo,
    fontSize: 18.sp,
    color: ColorsManager.blue,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font18YellowBold = TextStyle(
    fontSize: 18.sp,
    color: ColorsManager.yellow,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18RedBold = TextStyle(
    fontFamily: AppFonts.cairo,
    fontSize: 18.sp,
    color: ColorsManager.red,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font32BoldWhite = TextStyle(
    fontFamily: AppFonts.cairo,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.white,
  );
}
