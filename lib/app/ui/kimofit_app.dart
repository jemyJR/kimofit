import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/app/logic/cubit/language_state.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/routing/app_router.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/generated/l10n.dart';

class KimoFitApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;
  const KimoFitApp(
      {super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'KimoFit',
            theme: ThemeData(
              primaryColor: ColorsManager.blue,
              scaffoldBackgroundColor: ColorsManager.bgDark,
              fontFamily: Constants.appFont,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            onGenerateRoute: appRouter.generateRoute,
            locale: state.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
