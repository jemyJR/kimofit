import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_model.dart';
import 'package:kimofit/features/diet_plan/logic/diet_plan_cubit.dart';
import 'package:kimofit/features/diet_plan/ui/diet_plan_details_screen.dart';
import 'package:kimofit/features/diet_plan/ui/diet_plan_notes_screen.dart';
import 'package:kimofit/features/diet_plan/ui/diet_plan_screen.dart';
import 'package:kimofit/features/home/data/models/subscription_features_model.dart';
import 'package:kimofit/features/home/logic/home_cubit.dart';
import 'package:kimofit/features/home/ui/home_screen.dart';
import 'package:kimofit/features/home/ui/subscription_screen.dart';
import 'package:kimofit/features/home_cardio_plan/ui/warm_up_exercises_screen.dart';
import 'package:kimofit/features/login/logic/login_cubit.dart';
import 'package:kimofit/features/login/ui/login_screen.dart';
import 'package:kimofit/features/onboarding/ui/onboarding_screen.dart';
import 'package:kimofit/features/profile/logic/profile_cubit.dart';
import 'package:kimofit/features/profile/ui/change_password_screen.dart';
import 'package:kimofit/features/signup/logic/cubit/signup_cubit.dart';
import 'package:kimofit/features/signup/ui/signup_screen.dart';
import 'package:kimofit/features/supplement/logic/supplement_cubit.dart';
import 'package:kimofit/features/supplement/ui/supplement_screen.dart';
import 'package:kimofit/features/warm_up_exercises/ui/warm_up_exercises_details_screen.dart';
import 'package:kimofit/features/warm_up_exercises/ui/warm_up_exercises_screen.dart';
import 'package:kimofit/features/workout_exercises/ui/workout_exercises_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
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
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getHomeData(),
            child: const HomeScreen(),
          ),
        );
      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );
      case Routes.warmUpExercisesScreen:
        arguments as String;
        return MaterialPageRoute(
          builder: (context) => WarmUpExercisesScreen(title: arguments),
        );
      case Routes.warmUpExercisesDetailsScreen:
        arguments as String;
        return MaterialPageRoute(
          builder: (context) => WarmUpExercisesDetailsScreen(title: arguments),
        );
      case Routes.workoutExercisesScreen:
        return MaterialPageRoute(
          builder: (context) => const WorkoutExercisesScreen(),
        );
      case Routes.homeCardioPlanScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeCardioPlanScreen(),
        );
      case Routes.dietPlanScreen:
        arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DietPlanCubit>()..getDietPlanData(),
            child: DietPlanScreen(title: arguments),
          ),
        );
      case Routes.dietPlanDetailsScreen:
        arguments as DietModel;
        return MaterialPageRoute(
          builder: (context) => DietPlanDetailsScreen(diet: arguments),
        );
      case Routes.dietPlanNotesScreen:
        arguments as List<String>;
        return MaterialPageRoute(
          builder: (context) => DietPlanNotesScreen(notes: arguments),
        );

      case Routes.supplementScreen:
        arguments as String;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SupplementCubit>()..getSupplementData(),
            child: SupplementScreen(title: arguments),
          ),
        );
      case Routes.subscriptionScreen:
        arguments as SubscriptionFeaturesModel;

        return MaterialPageRoute(
          builder: (context) =>
              SubscriptionScreen(subscriptionFeatures: arguments),
        );
    }
    return null;
  }
}
