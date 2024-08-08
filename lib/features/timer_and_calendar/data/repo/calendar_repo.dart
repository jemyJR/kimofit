import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/calendar_day_params.dart';
import 'package:kimofit/features/timer_and_calendar/data/models/calendar_response_model.dart';

class CalendarRepo {
  final ApiConsumer api;
  final String calendarEndpoint;
  CalendarRepo({
    required this.api,
    required this.calendarEndpoint,
  });

  //! get calendar Data (Days)
  Future<Either<String, CalendarResponseModel>> getDays(
      {required CalendarDaysParams calendarDaysParams}) async {
    try {
      final response = await api.get(
        calendarEndpoint,
        queryParameters: calendarDaysParams.toJson(),
      );
      final workoutCalendarResponseModel =
          CalendarResponseModel.fromJson(response);

      return Right(workoutCalendarResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
