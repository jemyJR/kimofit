import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_response_model.dart';
import 'package:kimofit/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> getHomeData() async {
    emit(HomeLoading());

    final homeResponse = await homeRepo.getHomeData();
    homeResponse.fold(
      (trainerName) => emit(HomeFailure(trainerName: trainerName)),
      (homeResponseModel) {
        emit(HomeSuccess(homeResponseModel: homeResponseModel));
      },
    );
  }

  Future<void> refreshHomeData() async {
    emit(HomeLoading());
    await getHomeData();
  }
}
