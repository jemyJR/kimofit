import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';

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
  } else if (value == notFoundDay.getLocalizedText()) {
    return TextStyles.font18YellowBold;
  } else {
    return TextStyles.font18White;
  }
}
