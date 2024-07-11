import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

class TimeUpMessage extends StatelessWidget {
  const TimeUpMessage({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            S.of(context).timeUp,
            style: TextStyles.font22White,
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.check,
              color: ColorsManager.yellow,
              size: 40.sp,
            ),
          ),
        ],
      ),
    );
  }
}
