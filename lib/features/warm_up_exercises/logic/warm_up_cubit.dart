import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/warm_up_params.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_response_model.dart';
import 'package:kimofit/features/warm_up_exercises/data/repo/warm_up_repo.dart';

part 'warm_up_state.dart';

class WarmUpCubit extends Cubit<WarmUpState> {
  WarmUpCubit(this.warmUpRepo) : super(WarmUpInitial());
  final WarmUpRepo warmUpRepo;

  //! get Warm Up Exercise Data
  Future<void> getWarmUpExerciseData(
      {required WarmUpParams warmUpParams}) async {
    emit(WarmUpExerciseLoading());

    final warmUpExerciseResponse =
        await warmUpRepo.getWarmUpExerciseData(warmUpParams: warmUpParams);
    warmUpExerciseResponse.fold(
      (errorMessage) => emit(WarmUpExerciseFailure(errorMessage: errorMessage)),
      (warmUpExerciseResponseModel) {
        emit(WarmUpExerciseSuccess(
            warmUpExerciseResponseModel: warmUpExerciseResponseModel));
      },
    );
  }

  //! get warm up Category Data
  Future<void> getWarmUpCategoryData() async {
    emit(WarmUpCategoryLoading());

    final warmUpCategoryResponse = await warmUpRepo.getWarmUpCategoryData();
    warmUpCategoryResponse.fold(
      (errorMessage) => emit(WarmUpCategoryFailure(errorMessage: errorMessage)),
      (warmUpCategoryResponseModel) {
        emit(WarmUpCategorySuccess(
            warmUpCategoryResponseModel: warmUpCategoryResponseModel));
      },
    );
  }
}
