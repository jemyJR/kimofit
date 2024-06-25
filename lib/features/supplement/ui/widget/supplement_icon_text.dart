import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/supplement/data/models/supplement_doses_model.dart';
import 'package:kimofit/generated/l10n.dart';

enum IconText { dose, time }

class SupplementIconText extends StatelessWidget {
  const SupplementIconText({
    super.key,
    required this.iconText,
    required this.dose,
  });
  final IconText iconText;
  final SupplementDosesModel dose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconText == IconText.dose ? Icons.medication : Icons.access_time,
          color: ColorsManager.yellow,
        ),
        horizontalSpace(5),
        Expanded(
          child: Text(
            iconText == IconText.dose
                ? '${dose.dose} ${S.of(context).dose}'
                : dose.times,
            style: TextStyles.font15White,
          ),
        ),
      ],
    );
  }
}
