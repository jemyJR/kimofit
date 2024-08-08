import 'package:kimofit/features/workout_exercises/data/enums/exercise_type_eum.dart';

class WorkoutExercisesDetailsArgumentModel {
  final dynamic exercise;
  final ExerciseType type;

  WorkoutExercisesDetailsArgumentModel({
    required this.exercise,
    required this.type,
  });
}
