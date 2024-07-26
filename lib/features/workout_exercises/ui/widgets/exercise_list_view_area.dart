import 'package:flutter/material.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/cardio_exercise.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/group_of_exercise/group_of_exercise.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/workout_exercise.dart';

enum WorkoutExerciseType { workout, abs, cardio }

class ExerciseListViewArea extends StatelessWidget {
  const ExerciseListViewArea({
    super.key,
    required this.exercisesList,
    required this.type,
  });
  final List<dynamic> exercisesList;
  final WorkoutExerciseType type;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exercisesList.length,
      itemBuilder: (context, index) {
        final exerciseItem = exercisesList[index];
        if (exerciseItem.isSimpleExercise) {
          return type == WorkoutExerciseType.cardio
              ? CardioExercise(
                  exercise: exerciseItem.exercise!,
                )
              : WorkoutExercise(
                  exercise: exerciseItem.exercise!,
                );
        } else if (exerciseItem.isGroupExercise) {
          return GroupOfExercise(
            groupOfExercise: exerciseItem.groupExercises!,
            type: type,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
