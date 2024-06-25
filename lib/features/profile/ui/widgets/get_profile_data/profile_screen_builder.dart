import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/features/profile/logic/profile_cubit.dart';
import 'package:kimofit/features/profile/ui/profile_screen.dart';

class ProfileScreenBlocProvider extends StatelessWidget {
  const ProfileScreenBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfileData(),
      child: const ProfileScreen(),
    );
  }
}
