import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/diet_plan/ui/widget/diet_plan_bloc_builder/diet_plan_bloc_builder.dart';

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
      body: const DietPlanBlocBuilder(),
    );
  }
}
