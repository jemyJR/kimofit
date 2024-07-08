part of 'timer_and_calender_cubit.dart';

sealed class TimerAndCalenderState {}

final class TimerAndCalenderInitial extends TimerAndCalenderState {}

//! Calender states
class DropdownValueState extends TimerAndCalenderState {
  final LocalizedField? selectedValue;
  DropdownValueState(this.selectedValue);
}

//! Calender Mode
class CalenderModeState extends TimerAndCalenderState {}

//! Timer Options Mode
class TimerOptionsModeState extends TimerAndCalenderState {}
