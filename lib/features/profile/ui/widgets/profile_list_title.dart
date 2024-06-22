import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/profile/data/models/profile_list_title_model.dart';
import 'package:kimofit/generated/l10n.dart';

enum TraillingTextEnum { cm, kg, month, days }

class ProfileListTitle extends StatelessWidget {
  const ProfileListTitle({
    super.key,
    required this.profileListTitleModel,
  });

  final ProfileListTitleModel profileListTitleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.bgDarklow,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListTile(
          title: Text(
            '${profileListTitleModel.title} : ${profileListTitleModel.data ?? profileListTitleModel.dataLocalized?.getLocalizedText()}',
            style: TextStyles.font18White,
          ),
          leading: FaIcon(
            profileListTitleModel.leadingIcon,
            color: ColorsManager.white,
          ),
          trailing:
              getTrailingText(profileListTitleModel.trailingText, context),
        ),
      ),
    );
  }
}

// return enum trallingText
Widget? getTrailingText(TraillingTextEnum? traillingText, context) {
  switch (traillingText) {
    case TraillingTextEnum.cm:
      return Text(
        S.of(context).cm,
        style: TextStyles.font18White,
      );
    case TraillingTextEnum.kg:
      return Text(
        S.of(context).kg,
        style: TextStyles.font18White,
      );
    case TraillingTextEnum.month:
      return Text(
        S.of(context).month,
        style: TextStyles.font18White,
      );
    case TraillingTextEnum.days:
      return Text(
        S.of(context).days,
        style: TextStyles.font18White,
      );

    default:
      return null;
  }
}
