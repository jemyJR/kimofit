import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_model.dart';
import 'package:kimofit/core/widgets/exercise_slider/exercise_slider.dart';

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
              ExerciseSlider(
                exercises: warmUpExercises,
              ),
            ],
          ),
        ));
  }
}

//TODO: Remove this list and fetch it from the API
List<WarmUpExerciseModel> warmUpExercises = [
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
    duration: '5 دقائق',
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
    duration: '20 ثانيه',
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 12,
    duration: '20 ثانيه',
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/01-Warm-Up-Exercises-side-lying-rotation.gif',
    reps: 10,
    sets: 5,
    weight: 10,
  ),
  WarmUpExerciseModel(
    gifPath:
        'https://kimofit-production.up.railway.app/media/exercises/02-Warm-Up-Exercises-glue-bridges.gif',
    reps: 12,
    sets: 6,
    weight: 20,
  ),
];
