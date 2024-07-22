import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
