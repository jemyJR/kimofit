import 'package:flutter/material.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/features/home/ui/home_screen.dart';
import 'package:kimofit/features/login/ui/login_screen.dart';
import 'package:kimofit/features/onboarding/ui/onboarding_screen.dart';
import 'package:kimofit/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
    return null;
  }
}
