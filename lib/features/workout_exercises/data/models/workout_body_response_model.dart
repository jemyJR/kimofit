import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_item_model.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_model.dart';

class WorkoutBodyResponseModel {
  final WarmUpCategoryModel warmUpExercise;
  final List<WorkoutExerciseItem> workoutExercise;
  final List<WorkoutExerciseItem> absExercises;

  WorkoutBodyResponseModel({
    required this.warmUpExercise,
    required this.workoutExercise,
    required this.absExercises,
  });

  factory WorkoutBodyResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> workoutExercisesJson = json['workout-exercises'];
    final List<dynamic> absExercisesJson = json['abs-exercises'];

    List<WorkoutExerciseItem> workoutExercises =
        _parseExercises(workoutExercisesJson);
    List<WorkoutExerciseItem> absExercises = _parseExercises(absExercisesJson);

    return WorkoutBodyResponseModel(
      warmUpExercise: WarmUpCategoryModel.fromJson(json['warmup-exercise']),
      workoutExercise: workoutExercises,
      absExercises: absExercises,
    );
  }

  static List<WorkoutExerciseItem> _parseExercises(
      List<dynamic> exercisesJson) {
    List<WorkoutExerciseItem> exercises = [];
    Map<int, List<WorkoutExerciseModel>> currentGroup = {};

    for (var exerciseJson in exercisesJson) {
      final exercise = WorkoutExerciseModel.fromJson(exerciseJson);
      if (exercise.groupId != null) {
        // If there's a groupId, handle it as part of a group
        if (!currentGroup.containsKey(exercise.groupId)) {
          currentGroup[exercise.groupId!] = [];
        }
        currentGroup[exercise.groupId!]!.add(exercise);
      } else {
        // If there's no groupId, finalize any existing group and add a simple exercise
        if (currentGroup.isNotEmpty) {
          currentGroup.forEach((groupId, groupExercises) {
            exercises.add(WorkoutExerciseItem(groupExercises: groupExercises));
          });
          currentGroup.clear();
        }
        exercises.add(WorkoutExerciseItem(exercise: exercise));
      }
    }

    // Add any remaining group at the end
    if (currentGroup.isNotEmpty) {
      currentGroup.forEach((groupId, groupExercises) {
        exercises.add(WorkoutExerciseItem(groupExercises: groupExercises));
      });
    }

    return exercises;
  }
}
