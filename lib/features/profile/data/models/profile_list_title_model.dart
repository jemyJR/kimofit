import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title.dart';

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
