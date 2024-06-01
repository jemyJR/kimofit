import 'package:get_it/get_it.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register CacheHelper
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  // Initialize CacheHelper and SavedData
  await getIt<CacheHelper>().init();
  await SavedData.init();

  // Register LanguageCubit
  getIt.registerSingleton<LanguageCubit>(LanguageCubit());
}
