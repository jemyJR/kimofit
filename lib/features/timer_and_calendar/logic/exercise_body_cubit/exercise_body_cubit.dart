import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/enums/exercise_status_enum.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';
import 'package:kimofit/features/timer_and_calendar/logic/exercise_body_cubit/exercise_body_state.dart';

class ExerciseBodyCubit extends Cubit<ExerciseBodyState> {
  ExerciseBodyCubit(this.exerciseBodyRepo) : super(ExerciseBodyInitial());
  final dynamic exerciseBodyRepo;

  ExerciseStatus type = ExerciseStatus.normalDay;

  //! Get Exercise Body exercises
  Future<void> getBodyExercises(
      {required DropDownMenuParams dropDownMenuParams}) async {
    emit(ExerciseBodyLoading());

    _setTypeBasedOnDay(dropDownMenuParams.day);

    final exerciseBodyResponse = await exerciseBodyRepo.getBodyExercises(
        dropDownMenuParams: dropDownMenuParams);

    exerciseBodyResponse.fold(
      (errorMessage) => emit(ExerciseBodyFailure(errorMessage: errorMessage)),
      (exerciseBodyResponseModel) => emit(
        ExerciseBodySuccess(
            exerciseBodyResponseModel: exerciseBodyResponseModel),
      ),
    );
  }

  // Method to determine type based on selected day
  void _setTypeBasedOnDay(LocalizedField selectedDay) {
    if (selectedDay.en == restDay.en) {
      type = ExerciseStatus.restDay;
    } else if (selectedDay.en == notFoundDay.en) {
      type = ExerciseStatus.notFoundDay;
    } else {
      type = ExerciseStatus.normalDay;
    }
  }
}
