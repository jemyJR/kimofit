import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_model.dart';

class WarmUpExerciseResponseModel {
  WarmUpExerciseResponseModel({
    required this.results,
  });
  final List<WarmUpExerciseModel> results;

  factory WarmUpExerciseResponseModel.fromJson(List<dynamic> jsonList) {
    return WarmUpExerciseResponseModel(
      results: jsonList.map((e) => WarmUpExerciseModel.fromJson(e)).toList(),
    );
  }
}
