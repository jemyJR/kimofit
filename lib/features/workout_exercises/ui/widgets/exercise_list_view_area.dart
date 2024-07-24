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
          return type == WorkoutExerciseType.workout ||
                  type == WorkoutExerciseType.abs
              ? WorkoutExercise(
                  exercise: exerciseItem.exercise!,
                  heroId: 'simple-${index + 1}-$type',
                )
              : CardioExercise(
                  exercise: exerciseItem.exercise!,
                  heroId: 'simple-${index + 1}-$type',
                );
        } else if (exerciseItem.isGroupExercise) {
          return GroupOfExercise(
            groupOfExercise: exerciseItem.groupExercises!,
            heroId: List<String>.generate(
              exerciseItem.groupExercises!.length,
              (i) => 'group-${index + 1}-${i + 1}-$type',
            ),
            type: type,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
