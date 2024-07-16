import 'package:kimofit/features/home_cardio_plan/data/models/home_cardio_exercise_model.dart';

class HomeCardioPlanResponseModel {
  HomeCardioPlanResponseModel({
    required this.results,
  });
  final List<HomeCardioExerciseModel> results;

  factory HomeCardioPlanResponseModel.fromJson(List<dynamic> jsonList) {
    return HomeCardioPlanResponseModel(
      results:
          jsonList.map((e) => HomeCardioExerciseModel.fromJson(e)).toList(),
    );
  }
}
