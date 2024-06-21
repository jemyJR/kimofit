import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blue,
      appBar: CustomAppBar(
        title: S.of(context).myProfile,
        elevation: 0,
        backgroundColor: ColorsManager.dark,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
