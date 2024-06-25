import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/profile/data/models/change_password_request_model.dart';
import 'package:kimofit/features/profile/data/models/profile_response_model.dart';

class ProfileRepo {
  final ApiConsumer api;
  ProfileRepo(
    this.api,
  );
  Future<Either<String, String>> changePassword({
    required ChangePasswordModel changePasswordModel,
  }) async {
    try {
      final response = await api.post(
        ApiEndPoints.changePassword,
        data: changePasswordModel.toJson(),
      );
      return Right(response[ApiKey.success]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }

  Future<Either<String, ProfileResponseModel>> getProfileData() async {
    final String profile = await ApiEndPoints.profile();

    try {
      final response = await api.get(profile);
      final ProfileResponseModel profileResponsModel =
          ProfileResponseModel.fromJson(response);

      return Right(profileResponsModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
