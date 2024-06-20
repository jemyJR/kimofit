import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/app_fonts.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWithText extends StatelessWidget {
  const ShimmerWithText({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.textStyle,
    this.border = 10,
  });
  final double height;
  final double width;
  final String text;
  final TextStyle textStyle;
  final int? border;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorsManager.dark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(border!.r),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle.copyWith(fontFamily: AppFonts.lemonada),
          ),
        ),
      ),
    );
  }
}
