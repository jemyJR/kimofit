import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';

class HeaderTextAndContent extends StatelessWidget {
  const HeaderTextAndContent({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(40),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
            child: Text(
              title,
              style: TextStyles.font18White,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(30),
          child,
        ],
      ),
    );
  }
}
