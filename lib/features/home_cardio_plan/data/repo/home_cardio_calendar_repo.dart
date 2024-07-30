import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/calendar_day_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/models/home_cardio_calendar_response_model.dart';

class HomeCardioCalendarRepo {
  final ApiConsumer api;
  HomeCardioCalendarRepo(this.api);

  //! get calendar Data (Days)
  Future<Either<String, HomeCardioCalendarResponseModel>> getHomeCardioDays(
      {required CalendarDaysParams calendarDaysParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.homeCardioCalendar,
        queryParameters: calendarDaysParams.toJson(),
      );
      final homeCardioCalendarResponseModel =
          HomeCardioCalendarResponseModel.fromJson(response);

      return Right(homeCardioCalendarResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
