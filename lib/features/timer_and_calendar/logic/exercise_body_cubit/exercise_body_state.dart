sealed class ExerciseBodyState {}

final class ExerciseBodyInitial extends ExerciseBodyState {}

//! Exercise Body exercises states
final class ExerciseBodyLoading extends ExerciseBodyState {}

final class ExerciseBodySuccess extends ExerciseBodyState {
  final dynamic exerciseBodyResponseModel;
  ExerciseBodySuccess({required this.exerciseBodyResponseModel});
}

final class ExerciseBodyFailure extends ExerciseBodyState {
  final String errorMessage;
  ExerciseBodyFailure({required this.errorMessage});
}
