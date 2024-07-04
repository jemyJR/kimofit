import 'package:kimofit/core/networking/api/api_endpoints.dart';

class WarmUpExerciseModel {
  final String gifPath;
  final int? reps;
  final int? sets;
  final double? weight;
  final String? duration;

  WarmUpExerciseModel({
    required this.gifPath,
    this.reps,
    this.sets,
    this.weight,
    this.duration,
  });

  factory WarmUpExerciseModel.fromJson(Map<String, dynamic> json) {
    return WarmUpExerciseModel(
      gifPath: json[ApiKey.warmupImage],
      reps: json[ApiKey.warmupReps],
      sets: json[ApiKey.warmupSets],
      weight: json[ApiKey.warmupWeight],
      duration: json[ApiKey.warmupDuration],
    );
  }
}
