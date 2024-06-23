import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/profile/data/models/change_password_request_model.dart';

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
}
