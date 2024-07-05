import 'package:kimofit/core/networking/api/api_endpoints.dart';

class WarmUpParams {
  final String category;

  WarmUpParams({
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.warmupType: category,
    };
  }
}
