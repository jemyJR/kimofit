import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';

class WorkoutBodyResponseModel {
  final WarmUpCategoryModel warmUpExercise;

  WorkoutBodyResponseModel({required this.warmUpExercise});

  factory WorkoutBodyResponseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutBodyResponseModel(
      warmUpExercise: WarmUpCategoryModel.fromJson(json['warmup-exercise']),
    );
  }
}
