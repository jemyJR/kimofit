import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_with_text.dart';
import 'package:kimofit/generated/l10n.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.welcomeText,
    this.clientName,
    this.homeWelcomeMessage,
    this.isTrainerNameLoading = false,
  });
  final Text? welcomeText;
  final Text? clientName;
  final Text? homeWelcomeMessage;
  final bool? isTrainerNameLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.imagesLogoLogo,
            width: 70.w,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      welcomeText ?? const SizedBox.shrink(),
                      horizontalSpace(10),
                      clientName ?? const SizedBox.shrink(),
                      trainerNameShimmer(isTrainerNameLoading, context),
                      horizontalSpace(10),
                    ],
                  ),
                  homeWelcomeMessage ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          CustomButton(
            text: S.of(context).language,
            textStyle: TextStyles.font15White,
            backgroundColor: ColorsManager.blue,
            onPressed: () =>
                LoadingWidgetService().changeLanguageWithDelay(context),
          ),
        ],
      ),
    );
  }
}

Widget trainerNameShimmer(isTrainerNameLoading, context) {
  if (isTrainerNameLoading) {
    return ShimmerWithText(
      height: 25.h,
      width: 80.w,
      text: S.of(context).trainee,
      textStyle: TextStyles.font12White,
      border: 5,
    );
  }
  return const SizedBox.shrink();
}
