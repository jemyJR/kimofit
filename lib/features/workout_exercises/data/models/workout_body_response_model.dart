import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_item_model.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_model.dart';

class WorkoutBodyResponseModel {
  final WarmUpCategoryModel warmUpExercise;
  final List<WorkoutExerciseItem> workoutExercise;

  WorkoutBodyResponseModel({
    required this.warmUpExercise,
    required this.workoutExercise,
  });

  factory WorkoutBodyResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> workoutExercisesJson = json['workout-exercises'];

    List<WorkoutExerciseItem> workoutExercises = [];
    Map<int, List<WorkoutExerciseModel>> currentGroup = {};

    for (var exerciseJson in workoutExercisesJson) {
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
            workoutExercises
                .add(WorkoutExerciseItem(groupExercises: groupExercises));
          });
          currentGroup.clear();
        }
        workoutExercises.add(WorkoutExerciseItem(exercise: exercise));
      }
    }

    // Add any remaining group at the end
    if (currentGroup.isNotEmpty) {
      currentGroup.forEach((groupId, groupExercises) {
        workoutExercises
            .add(WorkoutExerciseItem(groupExercises: groupExercises));
      });
    }

    return WorkoutBodyResponseModel(
      warmUpExercise: WarmUpCategoryModel.fromJson(json['warmup-exercise']),
      workoutExercise: workoutExercises,
    );
  }
}
