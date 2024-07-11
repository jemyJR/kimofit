import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/theming/style.dart';

class DropdownMenuContainer extends StatelessWidget {
  final String value;
  final bool isSelected;

  const DropdownMenuContainer({
    super.key,
    required this.value,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _getBorderColor(isSelected, value),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        value,
        style: _getTextStyle(isSelected, value),
      ),
    );
  }
}

Color _getBorderColor(bool isSelected, String value) {
  if (value == restDay.getLocalizedText()) {
    return ColorsManager.red;
  } else if (isSelected) {
    return ColorsManager.blue;
  } else {
    return ColorsManager.gray;
  }
}

TextStyle _getTextStyle(bool isSelected, String value) {
  if (value == restDay.getLocalizedText()) {
    return TextStyles.font18RedBold;
  } else if (isSelected) {
    return TextStyles.font18BlueBold;
  } else {
    return TextStyles.font18White;
  }
}

LocalizedField restDay = LocalizedField(
  en: 'OFF',
  ar: 'الراحه',
);
