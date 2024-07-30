import 'package:flutter/material.dart';
import 'package:kimofit/features/workout_exercises/data/enums/exercise_type_eum.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/cardio_exercise_body.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise_base_body.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise_body.dart';

class ExerciseContainer extends StatelessWidget {
  const ExerciseContainer({
    super.key,
    required this.exercise,
    this.isGroupExercise = false,
    required this.type,
  });

  final dynamic exercise;
  final bool isGroupExercise;
  final ExerciseType type;

  @override
  Widget build(BuildContext context) {
    return WorkoutExerciseBaseBody(
      exercise: exercise,
      isGroupExercise: isGroupExercise,
      child: type == ExerciseType.cardio
          ? CardioExerciseBody(exercise: exercise)
          : WorkoutExerciseBody(exercise: exercise),
    );
  }
}
