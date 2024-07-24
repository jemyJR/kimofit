import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';

class WarmUpExerciseArea extends StatelessWidget {
  const WarmUpExerciseArea({super.key, required this.warmUpExercise});
  final WarmUpCategoryModel warmUpExercise;

  @override
  Widget build(BuildContext context) {
    return HeroAnimation(
      tag: Constants.warmUpHeroTag,
      child: CustomSubContainer(
        title: warmUpExercise.name.getLocalizedText(),
        imagePath: warmUpExercise.image,
        height: 100.h,
        onTap: () => context.pushNamed(
          Routes.warmUpExercisesDetailsScreen,
          arguments: warmUpExercise,
        ),
      ),
    );
  }
}
