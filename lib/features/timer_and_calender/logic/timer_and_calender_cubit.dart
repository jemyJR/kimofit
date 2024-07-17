import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/calender_day_params.dart';
import 'package:kimofit/features/home_cardio_plan/data/repo/home_cardio_plan_repo.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';
import 'package:vibration/vibration.dart';

part 'timer_and_calender_state.dart';

class TimerAndCalenderCubit extends Cubit<TimerAndCalenderState> {
  TimerAndCalenderCubit() : super(TimerAndCalenderInitial()) {
    loadWeeks();
  }

  //! Audio Player And Vibrator
  final AudioPlayer audioPlayer = AudioPlayer();

  void playSoundAndVibrate() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.play(
      AssetSource('audio/timer_sound.mp3'),
    );
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate();
    }
  }

  void stopSoundAndVibration() async {
    await audioPlayer.stop();
    Vibration.cancel();
  }

  //! Track current selected week and day
  LocalizedField? currentSelectedWeek;
  LocalizedField? currentSelectedDay;
  List<LocalizedField>? currentWeekList;
  List<LocalizedField>? currentDayList;

  LocalizedField emptyLocalizedField = LocalizedField(id: '', en: '', ar: '');

  //! Save and Load Selected Value
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

  //! Load Weeks and Days
  Future<void> loadWeeks() async {
    emit(TimerAndCalenderLoading());

    try {
      LocalizedField? cachedWeek =
          getSelectedValue(Constants.homeCardioSelectedWeek);

      LocalizedField initialWeek = cachedWeek ?? weeks.first;

      currentSelectedWeek = initialWeek;

      emit(TimerAndCalenderLoaded(
        weeks: weeks,
        selectedWeek: initialWeek,
        days: [],
        selectedDay: emptyLocalizedField,
      ));

      await loadDays(initialWeek);
    } catch (error) {
      emit(TimerAndCalenderFailure(errorMessage: error.toString()));
    }
  }

  Future<void> loadDays(LocalizedField week) async {
    emit(TimerAndCalenderLoading());

    try {
      CalenderDaysParams calenderDaysParams = CalenderDaysParams(week: week.id);
      final response = await getIt<HomeCardioPlanRepo>().getHomeCardioDays(
        calenderDaysParams: calenderDaysParams,
      );

      response.fold(
        (errorMessage) =>
            emit(TimerAndCalenderFailure(errorMessage: errorMessage)),
        (homeCardioCalenderResponseModel) {
          List<LocalizedField> days = homeCardioCalenderResponseModel.days;

          currentDayList = days;

          LocalizedField? cachedDay =
              getSelectedValue(Constants.homeCardioSelectedDay);

          LocalizedField initialDay = cachedDay ?? days.first;

          currentSelectedDay = initialDay;

          emit(TimerAndCalenderLoaded(
            days: days,
            weeks: weeks,
            selectedDay: initialDay,
            selectedWeek: week,
          ));

          saveSelectedValue(
            preferenceKey: Constants.homeCardioSelectedWeek,
            value: week,
          );
          saveSelectedValue(
            preferenceKey: Constants.homeCardioSelectedDay,
            value: initialDay,
          );
        },
      );
    } catch (errorMessage) {
      emit(TimerAndCalenderFailure(errorMessage: errorMessage.toString()));
    }
  }

  //! Select Week and Day

  void selectDay(LocalizedField day) {
    saveSelectedValue(
      preferenceKey: Constants.homeCardioSelectedDay,
      value: day,
    );

    final currentState = state;
    if (currentState is TimerAndCalenderLoaded) {
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
    await loadDays(week);
  }

  //! toggle between calender and timer
  void toggleMode() {
    if (state is TimerOptionsModeState ||
        state is CountdownTimerState ||
        state is TimeUpModeState) {
      stopSoundAndVibration();

      emit(TimerAndCalenderLoaded(
        days: currentSelectedDay != null ? currentDayList! : [],
        weeks: currentSelectedWeek != null ? weeks : [],
        selectedDay: currentSelectedDay ?? emptyLocalizedField,
        selectedWeek: currentSelectedWeek ?? emptyLocalizedField,
      ));
    } else {
      emit(TimerOptionsModeState());
    }
  }

  //! Countdown Timer
  void startCountDown(int duration) {
    emit(CountdownTimerState(duration: duration));
  }

  //! TimeUp
  void endCountDown() {
    emit(TimeUpModeState());
    playSoundAndVibrate();
  }

  //! Stop Countdown
  void showTimerOptions() {
    emit(TimerOptionsModeState());
    stopSoundAndVibration();
  }

  @override
  Future<void> close() {
    stopSoundAndVibration();
    return super.close();
  }
}
