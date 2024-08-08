import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/workout_exercises/data/models/general_exercise_model.dart';
import 'package:kimofit/features/workout_exercises/data/models/exercise_item_model.dart';

class ExerciseFieldsModel {
  final List<WarmUpCategoryModel> warmUpExercise;
  final List<ExerciseItem> workoutExercise;
  final List<ExerciseItem> absExercises;
  final List<ExerciseItem> cardioExercises;

  ExerciseFieldsModel({
    required this.warmUpExercise,
    required this.workoutExercise,
    required this.absExercises,
    required this.cardioExercises,
  });

  factory ExerciseFieldsModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> warmUpExercisesJson = json[ApiKey.workoutWarmUpsField];

    final List<dynamic> workoutExercisesJson = json[ApiKey.workoutField];

    final List<dynamic> absExercisesJson = json[ApiKey.workoutAbsField];

    final List<dynamic> cardioExercisesJson = json[ApiKey.workoutCardioField];

    List<ExerciseItem> workoutExercises = _parseExercises(workoutExercisesJson);
    List<ExerciseItem> absExercises = _parseExercises(absExercisesJson);
    List<ExerciseItem> cardioExercises = _parseExercises(cardioExercisesJson);

    return ExerciseFieldsModel(
      warmUpExercise: warmUpExercisesJson
          .map((e) => WarmUpCategoryModel.fromJson(e))
          .toList(),
      workoutExercise: workoutExercises,
      absExercises: absExercises,
      cardioExercises: cardioExercises,
    );
  }
  static List<ExerciseItem> _parseExercises(List<dynamic> exercisesJson) {
    List<ExerciseItem> exercises = [];
    Map<int, List<GeneralExerciseModel>> currentGroup = {};

    for (var exerciseJson in exercisesJson) {
      final exercise = GeneralExerciseModel.fromJson(exerciseJson);
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
            exercises.add(ExerciseItem(groupExercises: groupExercises));
          });
          currentGroup.clear();
        }
        exercises.add(ExerciseItem(exercise: exercise));
      }
    }

    // Add any remaining group at the end
    if (currentGroup.isNotEmpty) {
      currentGroup.forEach((groupId, groupExercises) {
        exercises.add(ExerciseItem(groupExercises: groupExercises));
      });
    }

    return exercises;
  }
}
