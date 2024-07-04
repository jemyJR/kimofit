import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_model.dart';

class WarmUpExerciseResponseModel {
  WarmUpExerciseResponseModel({
    required this.results,
  });
  final List<WarmUpExerciseModel> results;

  factory WarmUpExerciseResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> results = json[ApiKey.results];
    return WarmUpExerciseResponseModel(
        results: results.map((e) => WarmUpExerciseModel.fromJson(e)).toList());
  }
}
