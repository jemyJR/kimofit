import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_body_response_model.dart';

class WorkoutBodyRepo {
  final ApiConsumer api;
  WorkoutBodyRepo(this.api);

  //! get Workout Body Exercises
  Future<Either<String, WorkoutBodyResponseModel>> getBodyExercises(
      {required DropDownMenuParams dropDownMenuParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.workoutBody,
        queryParameters: dropDownMenuParams.toJson(),
      );
      final workoutBodyResponseModel =
          WorkoutBodyResponseModel.fromJson(response);

      return Right(workoutBodyResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
