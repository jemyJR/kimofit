import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title.dart';

import '../../../../generated/l10n.dart';

class ProfileListTitleModel {
  final String? title;
  final String? data;
  final LocalizedField? dataLocalized;
  final IconData? leadingIcon;
  final TraillingTextEnum? trailingText;

  ProfileListTitleModel({
    this.title,
    this.data,
    this.dataLocalized,
    this.leadingIcon,
    this.trailingText,
  });
  ProfileListTitleModel copyWith({
    String? title,
    String? data,
    LocalizedField? dataLocalized,
    IconData? leadingIcon,
    TraillingTextEnum? trailingText,
  }) {
    return ProfileListTitleModel(
      title: title ?? this.title,
      data: data ?? this.data,
      dataLocalized: dataLocalized ?? this.dataLocalized,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingText: trailingText ?? this.trailingText,
    );
  }
}

List<ProfileListTitleModel> profilePersonalList(BuildContext context) {
  return [
    ProfileListTitleModel(
      title: S.of(context).name,
      data: "محمد جمال محمد",
      leadingIcon: FontAwesomeIcons.user,
    ),
    ProfileListTitleModel(
      title: S.of(context).number,
      data: '01092131748',
      leadingIcon: FontAwesomeIcons.phone,
    ),
    ProfileListTitleModel(
      title: S.of(context).age,
      data: '23',
      leadingIcon: FontAwesomeIcons.calendar,
    ),
    ProfileListTitleModel(
      title: S.of(context).length,
      data: '177',
      leadingIcon: FontAwesomeIcons.ruler,
      trailingText: TraillingTextEnum.cm,
    ),
    ProfileListTitleModel(
      title: S.of(context).weight,
      data: '70',
      leadingIcon: FontAwesomeIcons.weightScale,
      trailingText: TraillingTextEnum.kg,
    )
  ];
}

List<ProfileListTitleModel> profileSubscriptionList(BuildContext context) {
  return [
    ProfileListTitleModel(
      title: S.of(context).startDate,
      data: "01/01/2024",
      leadingIcon: FontAwesomeIcons.hourglassStart,
    ),
    ProfileListTitleModel(
      title: S.of(context).endDate,
      data: "01/05/2024",
      leadingIcon: FontAwesomeIcons.hourglassEnd,
    ),
    ProfileListTitleModel(
      title: S.of(context).coachingDuration,
      data: '1',
      leadingIcon: FontAwesomeIcons.clock,
      trailingText: TraillingTextEnum.month,
    ),
  ];
}
