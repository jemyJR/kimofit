import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_plan_response_model.dart';

class DietPlanRepo {
  final ApiConsumer api;
  DietPlanRepo(this.api);

  Future<Either<String, DietPlanResponseModel>> getDietPlanData() async {
    try {
      final response = await api.get(ApiEndPoints.dietPlan);
      final DietPlanResponseModel dietPlanResponseModel =
          DietPlanResponseModel.fromJson(response);

      return Right(dietPlanResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
