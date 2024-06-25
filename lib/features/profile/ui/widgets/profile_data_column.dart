import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/features/profile/data/models/profile_list_title_model.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_view_with_title.dart';
import 'package:kimofit/generated/l10n.dart';

class ProfileDataColumn extends StatelessWidget {
  const ProfileDataColumn({
    super.key,
    this.personalInformationListLength = 5,
    required this.stateType,
    this.personalList,
    this.subscriptionList,
  });
  final int personalInformationListLength;
  final ProfilestateType stateType;
  final List<ProfileListTitleModel>? personalList;
  final List<ProfileListTitleModel>? subscriptionList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileListViewWithTitle(
          title: S.of(context).personalInformation,
          listLength: personalInformationListLength,
          proflileDataList: personalList ?? profilePersonalList(context),
          stateType: stateType,
        ),
        verticalSpace(20),
        ProfileListViewWithTitle(
          title: S.of(context).subscriptionDetails,
          listLength: profileSubscriptionList(context).length,
          proflileDataList:
              subscriptionList ?? profileSubscriptionList(context),
          stateType: stateType,
        ),
      ],
    );
  }
}

List<ProfileListTitleModel> profilePersonalList(BuildContext context) {
  return [
    ProfileListTitleModel(
      title: S.of(context).name,
      leadingIcon: FontAwesomeIcons.user,
    ),
    ProfileListTitleModel(
      title: S.of(context).number,
      leadingIcon: FontAwesomeIcons.phone,
    ),
    ProfileListTitleModel(
      title: S.of(context).age,
      leadingIcon: FontAwesomeIcons.calendar,
    ),
    ProfileListTitleModel(
      title: S.of(context).length,
      leadingIcon: FontAwesomeIcons.ruler,
      trailingText: TraillingTextEnum.cm,
    ),
    ProfileListTitleModel(
      title: S.of(context).weight,
      leadingIcon: FontAwesomeIcons.weightScale,
      trailingText: TraillingTextEnum.kg,
    )
  ];
}

List<ProfileListTitleModel> profileSubscriptionList(BuildContext context) {
  return [
    ProfileListTitleModel(
      title: S.of(context).startDate,
      leadingIcon: FontAwesomeIcons.hourglassStart,
    ),
    ProfileListTitleModel(
      title: S.of(context).endDate,
      leadingIcon: FontAwesomeIcons.hourglassEnd,
    ),
    ProfileListTitleModel(
      title: S.of(context).duration,
      leadingIcon: FontAwesomeIcons.clock,
      trailingText: TraillingTextEnum.month,
    ),
  ];
}
