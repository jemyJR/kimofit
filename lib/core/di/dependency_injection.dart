import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/dio_consumer.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/diet_plan/data/repo/diet_plan_repo.dart';
import 'package:kimofit/features/diet_plan/logic/diet_plan_cubit.dart';
import 'package:kimofit/features/food_recipe_book/data/repo/food_recipe_book_repo.dart';
import 'package:kimofit/features/food_recipe_book/logic/food_recipe_book_cubit.dart';
import 'package:kimofit/features/home/data/repo/home_repo.dart';
import 'package:kimofit/features/home/logic/home_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/data/repo/home_cardio_calender_repo.dart';
import 'package:kimofit/features/home_cardio_plan/data/repo/home_cardio_plan_repo.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_calender_cubit/home_cardio_calender_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_plan_cubit/home_cardio_plan_cubit.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/login/data/repos/login_repo.dart';
import 'package:kimofit/features/login/logic/login_cubit.dart';
import 'package:kimofit/features/profile/data/repo/profile_repo.dart';
import 'package:kimofit/features/profile/logic/profile_cubit.dart';
import 'package:kimofit/features/signup/data/repos/signup_repo.dart';
import 'package:kimofit/features/signup/logic/cubit/signup_cubit.dart';
import 'package:kimofit/features/supplement/data/repo/supplenemt_repo.dart';
import 'package:kimofit/features/supplement/logic/supplement_cubit.dart';
import 'package:kimofit/features/warm_up_exercises/data/repo/warm_up_repo.dart';
import 'package:kimofit/features/warm_up_exercises/logic/warm_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Initialize CacheHelper
  await getIt<CacheHelper>().init();

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

  // Register HomeCubit
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // Register ProfileCubit
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  // Register SupplementCubit
  getIt.registerLazySingleton<SupplementRepo>(() => SupplementRepo(getIt()));
  getIt.registerFactory<SupplementCubit>(() => SupplementCubit(getIt()));

  // Register DietPlanCubit
  getIt.registerLazySingleton<DietPlanRepo>(() => DietPlanRepo(getIt()));
  getIt.registerFactory<DietPlanCubit>(() => DietPlanCubit(getIt()));

  // Register WarmUpCubit
  getIt.registerLazySingleton<WarmUpRepo>(() => WarmUpRepo(getIt()));
  getIt.registerFactory<WarmUpCubit>(() => WarmUpCubit(getIt()));

  // Register TimerAndCalenderCubit
  getIt.registerFactory<TimerAndCalenderCubit>(() => TimerAndCalenderCubit());

  // Register HomeCardioPlanCubit
  getIt.registerLazySingleton<HomeCardioPlanRepo>(
      () => HomeCardioPlanRepo(getIt()));
  getIt
      .registerFactory<HomeCardioPlanCubit>(() => HomeCardioPlanCubit(getIt()));

  // Register HomeCardioCalenderCubit
  getIt.registerLazySingleton<HomeCardioCalenderRepo>(
      () => HomeCardioCalenderRepo(getIt()));
  getIt.registerFactory<HomeCardioCalenderCubit>(
      () => HomeCardioCalenderCubit(getIt()));

  // Register FoodRecipeBookCubit
  getIt.registerLazySingleton<FoodRecipeBookRepo>(
      () => FoodRecipeBookRepo(getIt()));
  getIt
      .registerFactory<FoodRecipeBookCubit>(() => FoodRecipeBookCubit(getIt()));
}
