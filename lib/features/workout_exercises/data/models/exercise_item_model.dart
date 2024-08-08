import 'package:kimofit/features/workout_exercises/data/models/general_exercise_model.dart';

class ExerciseItem {
  final GeneralExerciseModel? exercise;
  final List<GeneralExerciseModel>? groupExercises;

  ExerciseItem({
    this.exercise,
    this.groupExercises,
  });

  bool get isSimpleExercise => exercise != null;
  bool get isGroupExercise => groupExercises != null;
}
