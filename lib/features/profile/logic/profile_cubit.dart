import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/features/profile/data/models/profile_response_model.dart';
import 'package:kimofit/features/profile/data/repo/profile_repo.dart';
import '../data/models/change_password_request_model.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  GlobalKey<FormState> changePasswordFormKey = GlobalKey();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  changePassword() async {
    emit(ChangePasswordLoading());

    final changePasswordResponse = await profileRepo.changePassword(
      changePasswordModel: ChangePasswordModel(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );

    changePasswordResponse.fold(
      (errorMessage) => emit(ChangePasswordFailure(errorMessage: errorMessage)),
      (success) => emit(ChangePasswordSuccess(success: success)),
    );
  }

  getProfileData() async {
    emit(GetProfleDataLoading());
    final profileResponse = await profileRepo.getProfileData();

    profileResponse.fold(
      (errorMessage) => emit(GetProfleDataFailure(errorMessage: errorMessage)),
      (profileResponseModel) => emit(
          GetProfleDataSuccess(profileResponseModel: profileResponseModel)),
    );
  }
}
