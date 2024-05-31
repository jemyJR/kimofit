import 'package:get_it/get_it.dart';
import 'package:kimofit/core/cache/cache_helper.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Register CacheHelper
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
