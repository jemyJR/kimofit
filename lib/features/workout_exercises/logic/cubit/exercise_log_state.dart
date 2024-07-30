part of 'exercise_log_cubit.dart';

sealed class ExerciseLogState {}

final class ExerciseLogInitial extends ExerciseLogState {}

class ExerciseLogTableState extends ExerciseLogState {}

class ExerciseWeightPickerState extends ExerciseLogState {
  final String existingWeight;

  ExerciseWeightPickerState(this.existingWeight);
}
