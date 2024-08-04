import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/calendar_day_params.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';
import 'package:kimofit/features/workout_exercises/data/repo/workout_calendar_repo.dart';

part 'workout_calendar_state.dart';

class WorkoutCalendarCubit extends Cubit<WorkoutCalendarState> {
  WorkoutCalendarCubit(this.workoutCalendarRepo)
      : super(WorkoutCalendarInitial());
  final WorkoutCalendarRepo workoutCalendarRepo;

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
  Future<void> loadWorkoutWeeks() async {
    emit(WorkoutCalendarLoading());

    try {
      LocalizedField? cachedWeek =
          getSelectedValue(Constants.workoutSelectedWeek);

      LocalizedField initialWeek = cachedWeek ?? weeks.first;

      currentSelectedWeek = initialWeek;
      saveSelectedValue(
        preferenceKey: Constants.workoutSelectedWeek,
        value: initialWeek,
      );

      emit(WorkoutCalendarSuccess(
        weeks: weeks,
        selectedWeek: initialWeek,
        days: [],
        selectedDay: emptyLocalizedField,
      ));

      // Automatically load days for the initial week
      await getWorkoutDays(
        calendarDaysParams: CalendarDaysParams(week: initialWeek.id),
      );
    } catch (error) {
      emit(WorkoutCalendarFailure(errorMessage: error.toString()));
    }
  }

  //! Get home cardio days
  Future<void> getWorkoutDays({
    required CalendarDaysParams calendarDaysParams,
  }) async {
    emit(WorkoutCalendarLoading());

    final workoutCalendarResponse = await workoutCalendarRepo.getWorkoutDays(
        calendarDaysParams: calendarDaysParams);

    workoutCalendarResponse.fold(
      (errorMessage) =>
          emit(WorkoutCalendarFailure(errorMessage: errorMessage)),
      (workoutCalendarResponseModel) {
        List<LocalizedField> days = workoutCalendarResponseModel.days;
        currentDayList = days;

        // Get cached values
        LocalizedField? cachedDay =
            getSelectedValue(Constants.workoutSelectedDay);
        LocalizedField cachedWeek =
            getSelectedValue(Constants.workoutSelectedWeek) ?? weeks.first;

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
        emit(WorkoutCalendarSuccess(
          days: days,
          weeks: weeks,
          selectedDay: initialDay,
          selectedWeek: cachedWeek,
        ));

        // Update cache with the initial day
        saveSelectedValue(
          preferenceKey: Constants.workoutSelectedDay,
          value: initialDay,
        );
      },
    );
  }

  //! Select Week and Day
  void selectDay(LocalizedField day) {
    saveSelectedValue(
      preferenceKey: Constants.workoutSelectedDay,
      value: day,
    );

    final currentState = state;
    if (currentState is WorkoutCalendarSuccess) {
      currentSelectedDay = day;
      emit(currentState.copyWith(selectedDay: day));
    }
  }

  void selectWeek(LocalizedField week) async {
    saveSelectedValue(
      preferenceKey: Constants.workoutSelectedWeek,
      value: week,
    );
    currentSelectedWeek = week;
    await getWorkoutDays(
      calendarDaysParams: CalendarDaysParams(week: week.id),
    );
  }
}
