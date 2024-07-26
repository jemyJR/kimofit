import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_rounded_network_image.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/exercise_log/show_exercise_log.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/notes_alert_dialog/show_notes_alert_dialog.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/workout_exercise_name_and_sets.dart';

class WorkoutExercise extends StatelessWidget {
  const WorkoutExercise({
    super.key,
    required this.exercise,
    this.isGroupExercise = false,
  });

  final WorkoutExerciseModel exercise;
  final bool isGroupExercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isGroupExercise
          ? EdgeInsets.only(bottom: 10.h)
          : EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.workoutExercisesDetailsScreen,
          arguments: exercise,
        ),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: ColorsManager.dark,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeroAnimation(
                  tag: exercise.id.toString(),
                  child: CustomRoundedNetworkImage(
                    height: 100.h,
                    width: 80.w,
                    imageUrl: exercise.image,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WorkoutExerciseNameAndSets(
                            name: exercise.name.getLocalizedText(),
                            sets: exercise.logs.length.toString(),
                          ),
                          horizontalSpace(10),
                          exercise.notes.isNotEmpty
                              ? ShownotesAlertDialog(
                                  notes: exercise.notes,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      ShowExerciseLog(
                        name: exercise.name.getLocalizedText(),
                        id: exercise.id,
                        logs: exercise.logs,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
