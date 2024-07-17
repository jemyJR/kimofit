import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/calender_day_params.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/models/home_cardio_plan_response_model.dart';
import 'package:kimofit/features/home_cardio_plan/data/repo/home_cardio_plan_repo.dart';

import '../data/models/home_cardio_calender_response_model.dart';

part 'home_cardio_plan_state.dart';

class HomeCardioPlanCubit extends Cubit<HomeCardioPlanState> {
  HomeCardioPlanCubit(this.homeCardioPlanRepo) : super(HomeCardioPlanInitial());
  final HomeCardioPlanRepo homeCardioPlanRepo;

  //! get calender Data (Days)
  Future<void> getHomeCardioDays(
      {required CalenderDaysParams calenderDaysParams}) async {
    emit(HomeCardioCalenderLoading());
    final homeCardioCalenderResponse = await homeCardioPlanRepo
        .getHomeCardioDays(calenderDaysParams: calenderDaysParams);
    homeCardioCalenderResponse.fold(
      (errorMessage) =>
          emit(HomeCardioCalenderFailure(errorMessage: errorMessage)),
      (homeCardioCalenderResponseModel) => emit(
        HomeCardioCalenderSuccess(
            homeCardioCalenderResponseModel: homeCardioCalenderResponseModel),
      ),
    );
  }

  //! get home cardio plan exercises
  Future<void> getHomeCardioPlanExercises(
      {required DropDownMenuParams dropDownMenuParams}) async {
    emit(HomeCardioPlanLoading());
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
}
