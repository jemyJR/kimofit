import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/widgets/app_buttons.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/gradient.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_container.dart';
import 'package:kimofit/generated/l10n.dart';
import 'widgets/get_profile_data/get_profile_data_bloc_builder.dart';

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
        child: Column(
          children: [
            const ProfileContainer(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const GetProfileDataBlocBuilder(),
                      verticalSpace(20),
                      getButtonType(context, ButtonType.changePasswordScreen),
                      verticalSpace(10),
                      getButtonType(context, ButtonType.logOut),
                    ],
                  ),
                ),
              ),
            ),
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
