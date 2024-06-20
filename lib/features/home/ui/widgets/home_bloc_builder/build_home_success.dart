import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_response_model.dart';
import 'package:kimofit/features/home/ui/widgets/contacts_widget.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/home_categories_list_view.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_and_indicator.dart';
import 'package:kimofit/features/home/ui/widgets/sponsor_slider/sponsor_slider.dart';
import 'package:kimofit/generated/l10n.dart';

class BuildHomeSuccess extends StatelessWidget {
  const BuildHomeSuccess({super.key, required this.homeResponseModel});
  final HomeResponseModel homeResponseModel;

  @override
  Widget build(BuildContext context) {
    final bool isPaid = homeResponseModel.subscription.isPaid;

    return Column(
      children: [
        SafeArea(
          child: TopBar(
            welcomeText: Text(
              S.of(context).welcome,
              style: TextStyles.font22White,
            ),
            clientName: Text(
              homeResponseModel.trainerName.getLocalizedText(),
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
                ProfileAndIndicator(
                  subscription: homeResponseModel.subscription,
                ),
                isPaid
                    ? SponsorSlider(
                        sponsors: homeResponseModel.sponsors,
                      )
                    : const SizedBox.shrink(),
                HomeCategoriesListView(
                  homeCategories: homeResponseModel.categories,
                  isPaid: isPaid,
                ),
                const ContactsWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
