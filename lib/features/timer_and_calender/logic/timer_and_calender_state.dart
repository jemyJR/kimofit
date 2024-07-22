part of 'timer_and_calender_cubit.dart';

sealed class TimerAndCalenderState {}

final class TimerAndCalenderInitial extends TimerAndCalenderState {}

// //! Calender Mode
class CalenderModeState extends TimerAndCalenderState {}

//! Timer Options Mode
class TimerOptionsModeState extends TimerAndCalenderState {}

//! Countdown Timer Mode
class CountdownTimerState extends TimerAndCalenderState {
  final int duration;
  CountdownTimerState({required this.duration});
}

//! TimeUp Mode
class TimeUpModeState extends TimerAndCalenderState {}
