import 'package:dartz/dartz.dart';
import 'package:kimofit/core/helpers/extensions.dart';
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

      // format the height and weight to be like int 170.0 to be 170
      if (profileResponsModel.trainee.height != null) {
        profileResponsModel.trainee.height =
            profileResponsModel.trainee.height!.toFormattedNumber();
      }
      if (profileResponsModel.trainee.weight != null) {
        profileResponsModel.trainee.weight =
            profileResponsModel.trainee.weight!.toFormattedNumber();
      }

      return Right(profileResponsModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
