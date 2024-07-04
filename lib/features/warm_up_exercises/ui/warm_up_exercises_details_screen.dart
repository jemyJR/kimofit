import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/warm_up_exercises/ui/widget/warm_up_exercise_bloc_builder.dart';

class WarmUpExercisesDetailsScreen extends StatelessWidget {
  const WarmUpExercisesDetailsScreen({super.key, required this.category});
  final WarmUpCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: category.name.getLocalizedText(),
      ),
      body: WarmUpExerciseDataBlocBuilder(
        category: category,
      ),
    );
  }
}
