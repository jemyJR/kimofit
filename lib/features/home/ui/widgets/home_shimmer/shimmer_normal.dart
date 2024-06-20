import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNormal extends StatelessWidget {
  const ShimmerNormal({
    super.key,
    required this.height,
    required this.width,
    this.border = 10,
  });
  final double height;
  final double width;
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
          color: ColorsManager.dark,
          borderRadius: BorderRadius.circular(border!.r),
        ),
      ),
    );
  }
}
