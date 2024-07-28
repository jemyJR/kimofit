import 'package:flutter/material.dart';
import 'package:kimofit/features/workout_exercises/data/models/exercise_type_eum.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/group_of_exercise/group_of_exercise.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_container.dart';

class ExerciseListViewArea extends StatelessWidget {
  const ExerciseListViewArea({
    super.key,
    required this.exercisesList,
    required this.type,
  });
  final List<dynamic> exercisesList;
  final ExerciseType type;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exercisesList.length,
      itemBuilder: (context, index) {
        final exerciseItem = exercisesList[index];
        if (exerciseItem.isSimpleExercise) {
          return ExerciseContainer(
            exercise: exerciseItem.exercise,
            type: type,
          );
        } else if (exerciseItem.isGroupExercise) {
          return GroupOfExercise(
            groupOfExercise: exerciseItem.groupExercises,
            type: type,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
