import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/features/supplement/data/models/supplement_response_model.dart';
import 'package:kimofit/features/supplement/data/repo/supplenemt_repo.dart';

part 'supplement_state.dart';

class SupplementCubit extends Cubit<SupplementState> {
  SupplementCubit(this.supplementRepo) : super(SupplementInitial());
  final SupplementRepo supplementRepo;

  Future<void> getSupplementData() async {
    emit(SupplementLoading());
    final supplementResponse = await supplementRepo.getSupplementData();
    supplementResponse.fold(
      (errorMessage) => emit(SupplementFailure(errorMessage: errorMessage)),
      (supplementResponseModel) {
        emit(SupplementSuccess(
            supplementResponseModel: supplementResponseModel));
      },
    );
  }
}
