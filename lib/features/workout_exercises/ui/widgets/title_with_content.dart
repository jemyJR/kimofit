import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/theming/style.dart';

class TitleWithContent extends StatelessWidget {
  const TitleWithContent({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            title,
            style: TextStyles.font18White,
          ),
        ),
        child,
      ],
    );
  }
}
