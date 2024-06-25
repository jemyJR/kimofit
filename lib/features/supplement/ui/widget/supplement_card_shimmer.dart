import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';
import 'package:kimofit/features/supplement/ui/widget/build_supplement_dose.dart';
import 'package:shimmer/shimmer.dart';

class SupplementCardShimmer extends StatelessWidget {
  const SupplementCardShimmer(
      {super.key, required this.index, required this.supplement});
  final int index;
  final SupplementModel supplement;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.dark.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (index + 1).toString(),
              style: TextStyles.font15BlueBold,
            ),
            verticalSpace(5),
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: ColorsManager.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            verticalSpace(5),
            Center(
              child: Text(
                supplement.name.getLocalizedText(),
                style: TextStyles.font18White,
              ),
            ),
            verticalSpace(5),
            BuildSupplementDoses(doses: supplement.doses),
          ],
        ),
      ),
    );
  }
}
