import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/features/home/ui/home_screen.dart';
import 'package:kimofit/features/login/logic/cubit/login_cubit.dart';
import 'package:kimofit/features/login/ui/login_screen.dart';
import 'package:kimofit/features/onboarding/ui/onboarding_screen.dart';
import 'package:kimofit/features/signup/logic/cubit/signup_cubit.dart';
import 'package:kimofit/features/signup/ui/signup_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
    }
    return null;
  }
}
