import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/routing/app_router.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/generated/l10n.dart';

class KimoFitApp extends StatelessWidget {
  final AppRouter appRouter;
  const KimoFitApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'KimoFit',
        theme: ThemeData(
          primaryColor: ColorsManager.blue,
          scaffoldBackgroundColor: ColorsManager.bgDark,
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
