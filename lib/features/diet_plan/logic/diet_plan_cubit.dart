import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_plan_response_model.dart';
import 'package:kimofit/features/diet_plan/data/repo/diet_plan_repo.dart';

part 'diet_plan_state.dart';

class DietPlanCubit extends Cubit<DietPlanState> {
  DietPlanCubit(this.dietPlanRepo) : super(DietPlanInitial());
  final DietPlanRepo dietPlanRepo;

  Future<void> getDietPlanData() async {
    emit(DietPlanLoading());

    final dietPlanResponse = await dietPlanRepo.getDietPlanData();
    dietPlanResponse.fold(
      (errorMessage) => emit(DietPlanFailure(errorMessage: errorMessage)),
      (dietPlanResponseModel) {
        emit(DietPlanSuccess(dietPlanResponseModel: dietPlanResponseModel));
      },
    );
  }
}
