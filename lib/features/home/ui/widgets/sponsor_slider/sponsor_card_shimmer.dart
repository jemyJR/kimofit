import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/app_fonts.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class SponsorCardShimmer extends StatelessWidget {
  const SponsorCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.dark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            S.of(context).Sponsor,
            style: TextStyles.font32BoldWhite
                .copyWith(fontFamily: AppFonts.lemonada),
          ),
        ),
      ),
    );
  }
}
