import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/calender_day_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/repo/home_cardio_calender_repo.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';

part 'home_cardio_calender_state.dart';

class HomeCardioCalenderCubit extends Cubit<HomeCardioCalenderState> {
  HomeCardioCalenderCubit(this.homeCardioCalenderRepo)
      : super(HomeCardioCalenderInitial());
  final HomeCardioCalenderRepo homeCardioCalenderRepo;

  //! Track current selected week and day
  LocalizedField? currentSelectedWeek;
  LocalizedField? currentSelectedDay;
  List<LocalizedField>? currentDayList;

  LocalizedField emptyLocalizedField = LocalizedField(id: '', en: '', ar: '');

  //! Save and get Selected Value
  Future<void> saveSelectedValue({
    required String preferenceKey,
    required LocalizedField value,
  }) async {
    final valueJson = jsonEncode(value.toJson());
    getIt<CacheHelper>().saveData(key: preferenceKey, value: valueJson);
  }

  LocalizedField? getSelectedValue(String preferenceKey) {
    final selectedValueJson =
        getIt<CacheHelper>().getDataString(key: preferenceKey);
    return selectedValueJson != null
        ? LocalizedField.fromJson(jsonDecode(selectedValueJson))
        : null;
  }

  //! Load home cardio weeks
  Future<void> loadHomeCardioWeeks() async {
    emit(HomeCardioCalenderLoading());

    try {
      LocalizedField? cachedWeek =
          getSelectedValue(Constants.homeCardioSelectedWeek);

      LocalizedField initialWeek = cachedWeek ?? weeks.first;

      currentSelectedWeek = initialWeek;
      saveSelectedValue(
        preferenceKey: Constants.homeCardioSelectedWeek,
        value: initialWeek,
      );

      emit(HomeCardioCalenderSuccess(
        weeks: weeks,
        selectedWeek: initialWeek,
        days: [],
        selectedDay: emptyLocalizedField,
      ));

      // Automatically load days for the initial week
      await getHomeCardioDays(
        calenderDaysParams: CalenderDaysParams(week: initialWeek.id),
      );
    } catch (error) {
      emit(HomeCardioCalenderFailure(errorMessage: error.toString()));
    }
  }

  //! Get home cardio days
  Future<void> getHomeCardioDays({
    required CalenderDaysParams calenderDaysParams,
  }) async {
    emit(HomeCardioCalenderLoading());

    final homeCardioCalenderResponse = await homeCardioCalenderRepo
        .getHomeCardioDays(calenderDaysParams: calenderDaysParams);

    homeCardioCalenderResponse.fold(
      (errorMessage) =>
          emit(HomeCardioCalenderFailure(errorMessage: errorMessage)),
      (homeCardioCalenderResponseModel) {
        List<LocalizedField> days = homeCardioCalenderResponseModel.days;
        currentDayList = days;

        // Get cached values
        LocalizedField? cachedDay =
            getSelectedValue(Constants.homeCardioSelectedDay);
        LocalizedField cachedWeek =
            getSelectedValue(Constants.homeCardioSelectedWeek) ?? weeks.first;

        // Determine the initial day
        LocalizedField initialDay;
        if (cachedDay != null) {
          // Use cached day index - 1 if valid
          int index =
              int.tryParse(cachedDay.id) ?? 1; // Default to 1 if parsing fails
          initialDay = days[index - 1];
        } else {
          initialDay = days.first;
        }

        currentSelectedDay = initialDay;
        emit(HomeCardioCalenderSuccess(
          days: days,
          weeks: weeks,
          selectedDay: initialDay,
          selectedWeek: cachedWeek,
        ));

        // Update cache with the initial day
        saveSelectedValue(
          preferenceKey: Constants.homeCardioSelectedDay,
          value: initialDay,
        );
      },
    );
  }

  //! Select Week and Day
  void selectDay(LocalizedField day) {
    saveSelectedValue(
      preferenceKey: Constants.homeCardioSelectedDay,
      value: day,
    );

    final currentState = state;
    if (currentState is HomeCardioCalenderSuccess) {
      currentSelectedDay = day;
      emit(currentState.copyWith(selectedDay: day));
    }
  }

  void selectWeek(LocalizedField week) async {
    saveSelectedValue(
      preferenceKey: Constants.homeCardioSelectedWeek,
      value: week,
    );
    currentSelectedWeek = week;
    await getHomeCardioDays(
      calenderDaysParams: CalenderDaysParams(week: week.id),
    );
  }
}
