import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/header_text_and_content.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
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
        child: HeroAnimation(
          tag: Constants.warmUpHeroTag,

          // make this as column not listview because the listview will make the hero animation not work correctly ( widget jump )
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                warmUpCategoriesList.length,
                (index) {
                  final category = warmUpCategoriesList[index];
                  return CustomSubContainer(
                    title: category.name.getLocalizedText(),
                    imagePath: category.image,
                    height: 150.h,
                    onTap: () => context.pushNamed(
                      Routes.warmUpExercisesDetailsScreen,
                      arguments: category,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Remove this list and fetch it from the API
List<WarmUpCategoryModel> warmUpCategoriesList = [
  WarmUpCategoryModel(
    id: 1,
    name: LocalizedField(
      en: 'Upper Body Exercises',
      ar: 'تمارين الجزء العلوي',
    ),
    image:
        'https://kimofit-production.up.railway.app/media/categories/WorkoutExercises.jpg',
  ),
  WarmUpCategoryModel(
    id: 2,
    name: LocalizedField(
      en: 'Lower Body Exercises',
      ar: 'تمارين الجزء السفلي',
    ),
    image:
        'https://kimofit-production.up.railway.app/media/categories/WarmUpExercises.jpg',
  ),
];
