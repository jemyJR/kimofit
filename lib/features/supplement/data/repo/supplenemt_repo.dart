import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/supplement/data/models/supplement_response_model.dart';

class SupplementRepo {
  final ApiConsumer api;
  SupplementRepo(this.api);

  Future<Either<String, SupplementResponseModel>> getSupplementData() async {
    try {
      final response = await api.get(ApiEndPoints.supplement);
      final SupplementResponseModel supplementResponseModel =
          SupplementResponseModel.fromJson(response);

      return Right(supplementResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
