import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomHomeContainerShimmer extends StatelessWidget {
  const CustomHomeContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: Container(
          height: 150.h,
          decoration: BoxDecoration(
            color: ColorsManager.dark.withOpacity(0.01),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsManager.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 50.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
