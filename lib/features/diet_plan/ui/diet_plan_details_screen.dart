import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_model.dart';
import 'package:kimofit/features/diet_plan/data/models/option_model.dart';
import 'package:kimofit/features/diet_plan/ui/widget/diet_meal.dart';
import 'package:kimofit/features/diet_plan/ui/widget/diet_option_container.dart';
import 'package:kimofit/features/diet_plan/ui/widget/or_divider.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: ListView.builder(
          itemCount: diet.meals.length,
          itemBuilder: (context, index) {
            final meal = diet.meals[index];
            final List<Widget> options =
                generateOptionsForOneMeal(meal.options);

            return DietMeal(
              meal: meal,
              options: options,
              initiallyExpanded: index == 0 ? true : false,
            );
          },
        ),
      ),
    );
  }
}

// method to generate options for one meal
List<Widget> generateOptionsForOneMeal(List<OptionModel> options) {
  List<Widget> dietOptions = [];
  for (var i = 0; i < options.length; i++) {
    dietOptions.add(DietOptionContainer(option: options[i]));
    if (i < options.length - 1) {
      dietOptions.add(const OrDivider());
    }
  }
  return dietOptions;
}
