import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/gradient.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_container.dart';
import 'package:kimofit/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).myProfile,
        elevation: 0,
        backgroundColor: ColorsManager.dark,
        scrolledUnderElevation: 0,
      ),
      body: appBarUnderLineFix(
        child: const Column(
          children: [
            ProfileContainer(),
          ],
        ),
      ),
    );
  }
}

// To fix the issue, AppBar underLine show when navigating to ProfileScreen,
Widget appBarUnderLineFix({required Widget child}) {
  return Stack(
    children: [
      const GradientWidget(
        colors: [
          ColorsManager.dark,
          ColorsManager.blue,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.03, 0.03],
      ),
      child,
    ],
  );
}
