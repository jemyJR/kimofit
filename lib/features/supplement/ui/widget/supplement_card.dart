import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_network_image.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';
import 'package:kimofit/features/supplement/ui/widget/build_supplement_dose.dart';

class SupplementCard extends StatelessWidget {
  const SupplementCard(
      {super.key, required this.index, required this.supplement});
  final int index;
  final SupplementModel supplement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.dark,
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
          CustomNetworkImage(
            height: 100.h,
            width: double.infinity,
            imageUrl: supplement.image,
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
    );
  }
}
