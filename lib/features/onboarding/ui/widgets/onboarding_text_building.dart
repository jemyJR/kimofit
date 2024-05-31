import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/onboarding/data/obparagraph_list.dart';

class OnboardingTextBuilding extends StatelessWidget {
  const OnboardingTextBuilding({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var text in obparagraphList(context)) ...[
          Text(
            text,
            style: TextStyles.font22White,
            textAlign: TextAlign.center,
          ),
          verticalSpace(25),
        ],
      ],
    );
  }
}
