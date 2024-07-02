import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(
              color: ColorsManager.white,
              thickness: 1,
            ),
          ),
          horizontalSpace(10),
          Text(
            S.of(context).or,
            style: TextStyles.font18White,
          ),
          horizontalSpace(10),
          const Expanded(
            child: Divider(
              color: ColorsManager.white,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
