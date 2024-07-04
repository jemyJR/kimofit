import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroAnimation(
                tag: Constants.warmUpHeroTag,
                child: CustomSubContainer(
                  title: category.name.getLocalizedText(),
                  imagePath: category.image,
                  height: 100.h,
                  onTap: () => context.pop(),
                ),
              ),
            ],
          ),
        ));
  }
}
