import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/ui/widgets/subscription_end.dart';
import 'package:kimofit/generated/l10n.dart';

class BuildHomeFailure extends StatelessWidget {
  const BuildHomeFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: TopBar(
            welcomeText: Text(
              S.of(context).welcome,
              style: TextStyles.font22White,
            ),
            clientName: Text(
              _getTrainerName(),
              style: TextStyles.font22White,
            ),
            homeWelcomeMessage: Text(
              S.of(context).homeWelcomeMessage,
              style: TextStyles.font18Gray,
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: SubscriptionEnd(),
          ),
        ),
      ],
    );
  }
}

String _getTrainerName() {
  return getIt<CacheHelper>()
      .getLocalizedField(key: ApiKey.trainerName)!
      .getLocalizedText();
}
