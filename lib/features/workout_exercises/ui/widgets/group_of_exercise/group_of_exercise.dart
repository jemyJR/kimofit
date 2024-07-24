import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/form_of_exercise/title_form_of_exercise.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/workout_exercise.dart';

class GroupOfExercise extends StatelessWidget {
  const GroupOfExercise({
    super.key,
    required this.groupOfExercise,
    required this.heroId,
  });

  final List<WorkoutExerciseModel> groupOfExercise;
  final List<String> heroId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.blue),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TitleFormOfExercise(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: groupOfExercise.length,
                  itemBuilder: (context, index) {
                    final exercise = groupOfExercise[index];
                    return WorkoutExercise(
                      exercise: exercise,
                      heroId: heroId[index],
                      isGroupExercise: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
