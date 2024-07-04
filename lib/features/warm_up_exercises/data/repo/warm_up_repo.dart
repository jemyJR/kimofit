import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/warm_up_params.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_response_model.dart';

class WarmUpRepo {
  final ApiConsumer api;
  WarmUpRepo(this.api);

  Future<Either<String, WarmUpExerciseResponseModel>> getWarmUpExerciseData(
      {required WarmUpParams warmUpParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.warmups,
        queryParameters: {ApiKey.warmupType: warmUpParams.getParamsType},
      );
      final warmUpExerciseResponseModel =
          WarmUpExerciseResponseModel.fromJson(response);

      return Right(warmUpExerciseResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
