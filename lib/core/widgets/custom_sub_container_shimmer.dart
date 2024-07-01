import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomSubContainerShimmer extends StatelessWidget {
  const CustomSubContainerShimmer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Stack(
            children: [
              Container(
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: ColorsManager.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
