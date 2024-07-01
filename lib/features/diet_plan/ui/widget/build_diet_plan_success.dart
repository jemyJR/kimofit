import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_plan_response_model.dart';
import 'package:kimofit/generated/l10n.dart';

class BuildDietPlanSuccess extends StatelessWidget {
  const BuildDietPlanSuccess({super.key, required this.dietPlanResponseModel});
  final DietPlanResponseModel dietPlanResponseModel;

  @override
  Widget build(BuildContext context) {
    final dietsList = dietPlanResponseModel.diets;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            final diet = dietsList[index];
            return CustomSubContainer(
              title: diet.title.getLocalizedText(),
              imagePath: dietPlanResponseModel.image,
              height: 100.h,
              onTap: () => context.pushNamed(
                Routes.dietPlanDetailsScreen,
                arguments: diet,
              ),
            );
          },
          itemCount: dietsList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        CustomSubContainer(
          title: S.current.notes,
          imagePath: dietPlanResponseModel.image,
          height: 100.h,
          onTap: () => context.pushNamed(
            Routes.dietPlanNotesScreen,
            arguments: dietPlanResponseModel.notes,
          ),
        ),
      ],
    );
  }
}
