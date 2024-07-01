import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/generated/l10n.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(40),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
              child: Text(
                S.current.dietPlanHeaderMessage,
                style: TextStyles.font18White,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(30),
            ListView.builder(
              itemBuilder: (context, index) {
                final diet = dietCategoriesList[index];
                return CustomSubContainer(
                  title: diet.name.getLocalizedText(),
                  imagePath: diet.image,
                  height: 100.h,
                  onTap: () => context.pushNamed(
                    Routes.warmUpExercisesDetailsScreen,
                    arguments: diet.name.getLocalizedText(),
                  ),
                );
              },
              itemCount: dietCategoriesList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            CustomSubContainer(
              title: S.current.notes,
              imagePath:
                  'https://kimofit-production.up.railway.app/media/categories/WorkoutExercises.jpg',
              height: 100.h,
              onTap: () => context.pushNamed(
                Routes.warmUpExercisesDetailsScreen,
                arguments: S.current.notes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: Remove this list and fetch it from the API
List<WarmUpCategoryModel> dietCategoriesList = [
  WarmUpCategoryModel(
    id: 1,
    name: LocalizedField(
      en: 'Week 1',
      ar: 'الأسبوع الأول',
    ),
    image:
        'https://kimofit-production.up.railway.app/media/categories/WorkoutExercises.jpg',
  ),
  WarmUpCategoryModel(
    id: 2,
    name: LocalizedField(
      en: 'Week 2',
      ar: 'الأسبوع الثاني',
    ),
    image:
        'https://kimofit-production.up.railway.app/media/categories/WarmUpExercises.jpg',
  ),
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
