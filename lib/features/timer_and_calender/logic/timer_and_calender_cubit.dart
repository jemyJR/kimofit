import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:vibration/vibration.dart';

part 'timer_and_calender_state.dart';

class TimerAndCalenderCubit extends Cubit<TimerAndCalenderState> {
  TimerAndCalenderCubit() : super(TimerAndCalenderInitial());

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

  // //TODO: Remove this dummy data and replace it with real data
  List<LocalizedField> days = [
    LocalizedField(en: 'OFF', ar: 'الراحه', id: '7'),
    LocalizedField(en: 'one', ar: 'الاول', id: '1'),
    LocalizedField(en: 'two', ar: 'الثاني', id: '2'),
    LocalizedField(en: 'OFF', ar: 'الراحه', id: '3'),
    LocalizedField(en: 'four', ar: 'الرابع', id: '4'),
    LocalizedField(en: 'five', ar: 'الخامس', id: '5'),
    LocalizedField(en: 'six', ar: 'السادس', id: '6'),
  ];

  List<LocalizedField> weeks = [
    LocalizedField(en: 'one', ar: 'الاول', id: '1'),
    LocalizedField(en: 'two', ar: 'الثاني', id: '2'),
    LocalizedField(en: 'three', ar: 'الثالث', id: '3'),
    LocalizedField(en: 'four', ar: 'الرابع', id: '4'),
  ];

  //! Calender Logic ( Load and Save Selected Value )
  late DropDownMenuParams initParams = DropDownMenuParams(
    day: days.first.en,
    week: weeks.first.en,
  );

  void loadSelectedValue({required String preferenceKey}) {
    final selectedValueJson =
        getIt<CacheHelper>().getDataString(key: preferenceKey);
    if (selectedValueJson != null) {
      final selectedValue =
          LocalizedField.fromJson(jsonDecode(selectedValueJson));

      emit(DropdownValueState(selectedValue));
    } else {
      emit(DropdownValueState(null));
    }
  }

  void saveSelectedValue(
      {required String preferenceKey, required LocalizedField value}) {
    final valueJson = jsonEncode(value.toJson());
    getIt<CacheHelper>().saveData(key: preferenceKey, value: valueJson);

    emit(DropdownValueState(value));
  }

  //! toggle between calender and timer
  void toggleMode() {
    if (state is TimerOptionsModeState ||
        state is CountdownTimerState ||
        state is TimeUpModeState) {
      stopSoundAndVibration();
      emit(CalenderModeState());
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
