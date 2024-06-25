import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/profile/data/models/profile_list_title_model.dart';
import 'package:shimmer/shimmer.dart';

class ProfileListTitleShimmer extends StatelessWidget {
  const ProfileListTitleShimmer({
    super.key,
    required this.profileListTitleModel,
  });

  final ProfileListTitleModel profileListTitleModel;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ListTile(
            title: Text(
              '${profileListTitleModel.title} :',
              style: TextStyles.font18White,
            ),
            leading: FaIcon(
              profileListTitleModel.leadingIcon,
              color: ColorsManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
