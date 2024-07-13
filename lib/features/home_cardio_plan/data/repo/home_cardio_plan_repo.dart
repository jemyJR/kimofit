import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/calender_day_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/models/home_cardio_calender_response_model.dart';

class HomeCardioPlanRepo {
  final ApiConsumer api;
  HomeCardioPlanRepo(this.api);

  //! get calender Data (Days)

  Future<Either<String, HomeCardioCalenderResponseModel>> getHomeCardioDays(
      {required CalenderDaysParams calenderDaysParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.homeCardioCalender,
        queryParameters: calenderDaysParams.toJson(),
      );
      final homeCardioCalenderResponseModel =
          HomeCardioCalenderResponseModel.fromJson(response);

      return Right(homeCardioCalenderResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
