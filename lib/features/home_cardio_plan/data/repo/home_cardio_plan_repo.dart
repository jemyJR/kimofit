import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/models/home_cardio_plan_response_model.dart';

class HomeCardioPlanRepo {
  final ApiConsumer api;
  HomeCardioPlanRepo(this.api);

  //! get home cardio plan exercises
  Future<Either<String, HomeCardioPlanResponseModel>>
      getHomeCardioPlanExercises(
          {required DropDownMenuParams dropDownMenuParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.homeCardioPlan,
        queryParameters: dropDownMenuParams.toJson(),
      );
      final homeCardioPlanResponseModel =
          HomeCardioPlanResponseModel.fromJson(response);

      return Right(homeCardioPlanResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
