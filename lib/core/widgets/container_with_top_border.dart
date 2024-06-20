import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';

class ContainerWithTopBorder extends StatelessWidget {
  final Widget child;
  const ContainerWithTopBorder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.bgDarklow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w, bottom: 15.h),
        child: child,
      ),
    );
  }
}
