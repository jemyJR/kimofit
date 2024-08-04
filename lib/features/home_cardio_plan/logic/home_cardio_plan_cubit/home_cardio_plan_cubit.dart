import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/enums/exercise_status_enum.dart';
import 'package:kimofit/features/home_cardio_plan/data/models/home_cardio_plan_response_model.dart';
import 'package:kimofit/features/home_cardio_plan/data/repo/home_cardio_plan_repo.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';

part 'home_cardio_plan_state.dart';

class HomeCardioPlanCubit extends Cubit<HomeCardioPlanState> {
  HomeCardioPlanCubit(this.homeCardioPlanRepo) : super(HomeCardioPlanInitial());
  final HomeCardioPlanRepo homeCardioPlanRepo;

  ExerciseStatus type = ExerciseStatus.normalDay;

  //! Get home cardio plan exercises
  Future<void> getHomeCardioPlanExercises(
      {required DropDownMenuParams dropDownMenuParams}) async {
    emit(HomeCardioPlanLoading());

    _setTypeBasedOnDay(dropDownMenuParams.day);

    final homeCardioPlanResponse = await homeCardioPlanRepo
        .getHomeCardioPlanExercises(dropDownMenuParams: dropDownMenuParams);

    homeCardioPlanResponse.fold(
      (errorMessage) => emit(HomeCardioPlanFailure(errorMessage: errorMessage)),
      (homeCardioPlanResponseModel) => emit(
        HomeCardioPlanSuccess(
            homeCardioPlanResponseModel: homeCardioPlanResponseModel),
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
