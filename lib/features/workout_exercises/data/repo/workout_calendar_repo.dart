import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/params/calendar_day_params.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_calendar_response_model.dart';

class WorkoutCalendarRepo {
  final ApiConsumer api;
  WorkoutCalendarRepo(this.api);

  //! get calendar Data (Days)
  Future<Either<String, WorkoutCalendarResponseModel>> getWorkoutDays(
      {required CalendarDaysParams calendarDaysParams}) async {
    try {
      final response = await api.get(
        ApiEndPoints.workoutCalendar,
        queryParameters: calendarDaysParams.toJson(),
      );
      final workoutCalendarResponseModel =
          WorkoutCalendarResponseModel.fromJson(response);

      return Right(workoutCalendarResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
