import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';

class WarmUpExerciseDetailsBase extends StatelessWidget {
  const WarmUpExerciseDetailsBase({
    super.key,
    required this.category,
    required this.child,
  });
  final WarmUpCategoryModel category;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(30),
          HeroAnimation(
            tag: Constants.warmUpHeroTag,
            child: CustomSubContainer(
              title: category.name.getLocalizedText(),
              imagePath: category.image,
              height: 100.h,
              onTap: () => context.pop(),
            ),
          ),
          verticalSpace(20),
          child,
        ],
      ),
    );
  }
}
