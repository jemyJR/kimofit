import 'package:kimofit/core/networking/api/api_endpoints.dart';

class HomeCardioExerciseModel {
  final String gifPath;
  final int? reps;
  final int? sets;
  num? weight;
  final String? duration;

  HomeCardioExerciseModel({
    required this.gifPath,
    this.reps,
    this.sets,
    this.weight,
    this.duration,
  });

  factory HomeCardioExerciseModel.fromJson(Map<String, dynamic> json) {
    return HomeCardioExerciseModel(
      gifPath: json[ApiKey.homeCardio][ApiKey.homeCardioImage],
      reps: json[ApiKey.homeCardioReps],
      sets: json[ApiKey.homeCardioSets],
      weight: json[ApiKey.homeCardioWeight],
      duration: json[ApiKey.homeCardioDuration],
    );
  }
}
