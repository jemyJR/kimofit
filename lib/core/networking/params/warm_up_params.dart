import 'package:kimofit/core/networking/api/api_endpoints.dart';

class WarmUpParams {
  final int id;

  WarmUpParams({
    required this.id,
  });

  String get getParamsType {
    switch (id) {
      case 1:
        return ApiKey.warmupUpper;
      case 2:
        return ApiKey.warmupLower;
      default:
        return '';
    }
  }
}
