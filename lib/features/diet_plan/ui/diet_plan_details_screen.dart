import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_model.dart';

class DietPlanDetailsScreen extends StatelessWidget {
  const DietPlanDetailsScreen({super.key, required this.diet});
  final DietModel diet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: diet.title.getLocalizedText(),
      ),
    );
  }
}
