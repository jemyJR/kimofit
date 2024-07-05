import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/header_text_and_content.dart';
import 'package:kimofit/features/warm_up_exercises/ui/widget/warm_up_exercise_category_bloc_builder.dart';
import 'package:kimofit/generated/l10n.dart';

class WarmUpExercisesScreen extends StatelessWidget {
  const WarmUpExercisesScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: HeaderTextAndContent(
        title: S.current.warmUpExerciseHeaderMessage,
        child: const WarmUpExerciseCategoryBlocBuilder(),
      ),
    );
  }
}
