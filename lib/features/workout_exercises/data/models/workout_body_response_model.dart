import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/workout_exercises/data/models/exercise_fields_model.dart';

class WorkoutBodyResponseModel {
  final ExerciseFieldsModel workoutFields;

  WorkoutBodyResponseModel({
    required this.workoutFields,
  });

  factory WorkoutBodyResponseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutBodyResponseModel(
      workoutFields: ExerciseFieldsModel.fromJson(json[ApiKey.workoutResponse]),
    );
  }
}
