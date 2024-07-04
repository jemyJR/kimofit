part of 'warm_up_cubit.dart';

sealed class WarmUpState {}

final class WarmUpInitial extends WarmUpState {}

//! Warm up exercise states

final class WarmUpExerciseLoading extends WarmUpState {}

final class WarmUpExerciseSuccess extends WarmUpState {
  final WarmUpExerciseResponseModel warmUpExerciseResponseModel;
  WarmUpExerciseSuccess({required this.warmUpExerciseResponseModel});
}

final class WarmUpExerciseFailure extends WarmUpState {
  final String errorMessage;
  WarmUpExerciseFailure({required this.errorMessage});
}
