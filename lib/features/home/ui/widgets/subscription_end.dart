import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/app_buttons.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class SubscriptionEnd extends StatelessWidget {
  const SubscriptionEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(20),
          Lottie.asset(
            Assets.animationSubscriptionEndAlert,
            width: 200.w,
            reverse: true,
            repeat: true,
          ),
          Text(
            S.of(context).subscriptionEndMessage,
            style: TextStyles.font22White,
            textAlign: TextAlign.center,
          ),
          verticalSpace(100),
          // button
          getButtonType(context, ButtonType.contactme),
          verticalSpace(10),
          getButtonType(
            context,
            ButtonType.logOut,
            btnColor: ColorsManager.yellow,
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
