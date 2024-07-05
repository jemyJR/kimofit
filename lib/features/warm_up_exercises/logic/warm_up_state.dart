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

//! Warm up category states
final class WarmUpCategoryLoading extends WarmUpState {}

final class WarmUpCategorySuccess extends WarmUpState {
  final List<WarmUpCategoryModel> warmUpCategoryResponseModel;
  WarmUpCategorySuccess({required this.warmUpCategoryResponseModel});
}

final class WarmUpCategoryFailure extends WarmUpState {
  final String errorMessage;
  WarmUpCategoryFailure({required this.errorMessage});
}
