import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/data/test_home_data.dart';
import 'package:kimofit/features/home/ui/widgets/contacts_widget.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/custom_home_container.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/custom_home_container_shimmer.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_and_indicator.dart';
import 'package:kimofit/features/home/ui/widgets/sponsor_slider/sponsor_slider.dart';
import 'package:kimofit/features/home/ui/widgets/subscription_end.dart';
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
          subscription.status
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileAndIndicator(subscription: subscription),
                        SponsorSlider(sponsors: sponsors),
                        const CustomHomeContainerShimmer(),
                        ListView.builder(
                            itemCount: homeCategories.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return CustomHomeContainer(
                                homeCategoryNav: homeCategories[index],
                                index: index,
                                text: category.name.getLocalizedText(),
                                color: ColorsManager.blue,
                                imagePath: category.image,
                                isPaid: false,
                              );
                            }),
                        const ContactsWidget(),
                      ],
                    ),
                  ),
                )
              : const SubscriptionEnd(),
        ],
      ),
    );
  }
}
