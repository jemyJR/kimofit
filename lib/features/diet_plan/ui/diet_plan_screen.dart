import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';

import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/diet_plan/ui/widget/diet_plan_bloc_builder.dart';
import 'package:kimofit/generated/l10n.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(40),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
              child: Text(
                S.current.dietPlanHeaderMessage,
                style: TextStyles.font18White,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(30),
            const DietPlanBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
