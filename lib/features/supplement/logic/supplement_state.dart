part of 'supplement_cubit.dart';

sealed class SupplementState {}

final class SupplementInitial extends SupplementState {}

final class SupplementLoading extends SupplementState {}

final class SupplementSuccess extends SupplementState {
  final SupplementResponseModel supplementResponseModel;
  SupplementSuccess({required this.supplementResponseModel});
}

final class SupplementFailure extends SupplementState {
  final String errorMessage;
  SupplementFailure({required this.errorMessage});
}
