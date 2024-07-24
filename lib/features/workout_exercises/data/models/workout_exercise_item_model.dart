import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_model.dart';

class WorkoutExerciseItem {
  final WorkoutExerciseModel? exercise;
  final List<WorkoutExerciseModel>? groupExercises;

  WorkoutExerciseItem({
    this.exercise,
    this.groupExercises,
  });

  bool get isSimpleExercise => exercise != null;
  bool get isGroupExercise => groupExercises != null;
}
