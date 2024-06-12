import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/data/models/subscription_model.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_and_indicator.dart';
import 'package:kimofit/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SubscriptionModel subscription = SubscriptionModel(
    startDate: '2024-06-11',
    endDate: '2024-06-19',
    status: true,
    percent: 26.666666666666668,
  );

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
          ProfileAndIndicator(subscription: subscription),
        ],
      ),
    );
  }
}
