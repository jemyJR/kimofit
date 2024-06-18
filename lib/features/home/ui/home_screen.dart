import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/data/test_home_data.dart';
import 'package:kimofit/features/home/ui/widgets/custom_home_container.dart';
import 'package:kimofit/features/home/ui/widgets/custom_home_container_shimmer.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_and_indicator.dart';
import 'package:kimofit/features/home/ui/widgets/sponsor_slider/sponsor_slider.dart';
import 'package:kimofit/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      body: Column(
        children: [
          SafeArea(
            child: TopBar(
              welcomeText: Text(
                S.of(context).welcome,
                style: TextStyles.font22White,
              ),
              clientName: Text(
                'محمد جمال'.getFirstWord(),
                style: TextStyles.font22White,
              ),
              homeWelcomeMessage: Text(
                S.of(context).homeWelcomeMessage,
                style: TextStyles.font18Gray,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileAndIndicator(subscription: subscription),
                  SponsorSlider(sponsors: sponsors),
                  const CustomHomeContainerShimmer(),
                  CustomHomeContainer(
                    navName: 'workout',
                    text: 'تمارين',
                    color: ColorsManager.blue,
                    imagePath: sponsors[2].image,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
