import 'package:kimofit/core/networking/api/api_endpoints.dart';

class ExerciseLogsModel {
  final int? sets;
  final int? reps;
  final num? weight;
  final String? duration;

  ExerciseLogsModel({
    this.sets,
    this.reps,
    this.weight,
    this.duration,
  });

  factory ExerciseLogsModel.fromJson(Map<String, dynamic> json) {
    return ExerciseLogsModel(
      sets: json[ApiKey.workoutExerciseSets],
      reps: json[ApiKey.workoutExerciseReps],
      weight: json[ApiKey.workoutExerciseWeight],
      duration: json[ApiKey.workoutExerciseDuration],
    );
  }
}
