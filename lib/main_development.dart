import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/app/ui/kimofit_app.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/routing/app_router.dart';
import 'package:kimofit/core/routing/initial_route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  String initialRoute = await InitialRouteManager.determineInitialRoute();

  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  runApp(
    BlocProvider(
      create: (context) => getIt<LanguageCubit>(),
      child: KimoFitApp(
        appRouter: AppRouter(),
        initialRoute: initialRoute,
      ),
    ),
  );
}
