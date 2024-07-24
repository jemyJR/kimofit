import 'package:flutter/material.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_item_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/group_of_exercise/group_of_exercise.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/workout_exercise.dart';

enum WorkoutExerciseType { workout, abs }

class WorkoutExerciseArea extends StatelessWidget {
  const WorkoutExerciseArea({
    super.key,
    required this.workoutExercise,
    required this.type,
  });
  final List<WorkoutExerciseItem> workoutExercise;
  final WorkoutExerciseType type;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workoutExercise.length,
      itemBuilder: (context, index) {
        final exerciseItem = workoutExercise[index];
        if (exerciseItem.isSimpleExercise) {
          return WorkoutExercise(
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
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
