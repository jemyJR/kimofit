import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/dio_consumer.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/login/data/repos/login_repo.dart';
import 'package:kimofit/features/login/logic/cubit/login_cubit.dart';
import 'package:kimofit/features/signup/data/repos/signup_repo.dart';
import 'package:kimofit/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Initialize CacheHelper and SavedData
  await getIt<CacheHelper>().init();

  // Initialize SavedData
  await SavedData.init();

  // Register LoadingWidgetService
  getIt.registerLazySingleton<LoadingWidgetService>(
      () => LoadingWidgetService());

  // Register Dio and ApiConsumer
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt<Dio>()));

  // Register LanguageCubit
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());

  // Register LoginCubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Register SignupCubit
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
