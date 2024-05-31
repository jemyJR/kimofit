import 'package:flutter/material.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/routing/app_router.dart';
import 'package:kimofit/core/routing/initial_route_manager.dart';
import 'package:kimofit/kimofit_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await getIt<CacheHelper>().init();
  String initialRoute = await InitialRouteManager.determineInitialRoute();

  runApp(
    KimoFitApp(
      appRouter: AppRouter(),
      initialRoute: initialRoute,
    ),
  );
}
