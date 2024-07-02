part of 'diet_plan_cubit.dart';

sealed class DietPlanState {}

final class DietPlanInitial extends DietPlanState {}

final class DietPlanLoading extends DietPlanState {}

final class DietPlanSuccess extends DietPlanState {
  final DietPlanResponseModel dietPlanResponseModel;
  DietPlanSuccess({required this.dietPlanResponseModel});
}

final class DietPlanFailure extends DietPlanState {
  final String errorMessage;
  DietPlanFailure({required this.errorMessage});
}
