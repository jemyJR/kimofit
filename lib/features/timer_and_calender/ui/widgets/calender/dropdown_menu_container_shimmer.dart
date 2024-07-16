import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType { day, week }

class DropdownMenuContainerShimmer extends StatelessWidget {
  const DropdownMenuContainerShimmer({super.key, required this.type});

  final ShimmerType type;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        width: 120.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: ColorsManager.white,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          type == ShimmerType.day ? S.of(context).day : S.of(context).week,
          style: TextStyles.font18White,
        ),
      ),
    );
  }
}
