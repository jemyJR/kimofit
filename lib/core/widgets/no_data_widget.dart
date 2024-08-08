import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/app_buttons.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Lottie.asset(
            Assets.animationNoData,
            width: 150.w,
            fit: BoxFit.contain,
            reverse: true,
            repeat: true,
          ),
          const Spacer(),
          Text(
            S.of(context).noDataMessage,
            style: TextStyles.font22White,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          // button
          getButtonType(context, ButtonType.contactme),
          const Spacer(),
        ],
      ),
    );
  }
}
