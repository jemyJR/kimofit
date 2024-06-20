import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/ui/widgets/subscription_end.dart';
import 'package:kimofit/generated/l10n.dart';

class BuildHomeFailure extends StatelessWidget {
  const BuildHomeFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: TopBar(
              welcomeText: Text(
                S.of(context).welcome,
                style: TextStyles.font22White,
              ),
              clientName: Text(
                _getTrainerName(context),
                style: TextStyles.font22White,
              ),
              homeWelcomeMessage: Text(
                S.of(context).homeWelcomeMessage,
                style: TextStyles.font18Gray,
              ),
            ),
          ),
          const Center(
            child: SubscriptionEnd(),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}

String _getTrainerName(context) {
  final trainerName =
      getIt<CacheHelper>().getLocalizedField(key: ApiKey.trainerName);
  if (trainerName != null) {
    return trainerName.getLocalizedText().getFirstWord();
  } else {
    return S.of(context).trainee;
  }
}
