import 'package:dartz/dartz.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/warm_up_params.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_response_model.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_response_model.dart';

class WarmUpRepo {
  final ApiConsumer api;
  WarmUpRepo(this.api);

  //! get Warm Up Exercise Data
  Future<Either<String, WarmUpExerciseResponseModel>> getWarmUpExerciseData(
      {required WarmUpParams warmUpParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.warmups,
        queryParameters: warmUpParams.toJson(),
      );
      final warmUpExerciseResponseModel =
          WarmUpExerciseResponseModel.fromJson(response);

      // format the weight to be like int 5.0 to be 5
      for (var item in warmUpExerciseResponseModel.results) {
        if (item.weight != null) {
          item.weight = item.weight!.toFormattedNumber();
        }
      }

      return Right(warmUpExerciseResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }

  //! get warm up Category Data
  Future<Either<String, List<WarmUpCategoryModel>>>
      getWarmUpCategoryData() async {
    try {
      final response = await api.get(ApiEndPoints.warmupcategories);
      final warmUpCategoryResponseModel =
          WarmUpCategoryResponseModel.fromJson(response);
      return Right(warmUpCategoryResponseModel.results);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
