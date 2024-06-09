import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/background_widget.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/core/widgets/gradient.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/onboarding/ui/widgets/onboarding_text_building.dart';
import 'package:kimofit/generated/l10n.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(imagePath: Assets.imagesBgOnboarding),
          const GradientWidget(),
          SafeArea(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const OnboardingTextBuilding(),
                          CustomButton(
                            text: S.of(context).getStarted,
                            textStyle: TextStyles.font18White,
                            backgroundColor: ColorsManager.yellow,
                            onPressed: () => visitedAndRoute(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void visitedAndRoute(BuildContext context) {
  getIt<CacheHelper>().saveData(
    key: Constants.isOnBoardingVisited,
    value: true,
  );
  context.pushReplacementNamed(Routes.loginScreen);
}
