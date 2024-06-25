import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/features/supplement/data/models/supplement_doses_model.dart';
import 'package:kimofit/features/supplement/ui/widget/supplement_icon_text.dart';

class BuildSupplementDoses extends StatelessWidget {
  const BuildSupplementDoses({super.key, required this.doses});
  final List<SupplementDosesModel> doses;

  @override
  Widget build(BuildContext context) {
    List<Widget> doseWidgets = [];
    for (int i = 0; i < doses.length; i++) {
      SupplementDosesModel dose = doses[i];

      doseWidgets.add(SupplementIconText(
        iconText: IconText.dose,
        dose: dose,
      ));
      doseWidgets.add(verticalSpace(5));
      doseWidgets.add(SupplementIconText(
        iconText: IconText.time,
        dose: dose,
      ));

      if (i < doses.length - 1) {
        doseWidgets.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Divider(),
        ));
      }
    }

    return Column(
      children: doseWidgets,
    );
  }
}
