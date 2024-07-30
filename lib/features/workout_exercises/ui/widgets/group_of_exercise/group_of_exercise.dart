import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/features/workout_exercises/data/enums/exercise_type_eum.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/group_of_exercise/title_group_of_exercise.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_container.dart';

class GroupOfExercise extends StatelessWidget {
  const GroupOfExercise({
    super.key,
    required this.groupOfExercise,
    required this.type,
  });

  final List<dynamic> groupOfExercise;
  final ExerciseType type;

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
                    return ExerciseContainer(
                      exercise: exercise,
                      type: type,
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
