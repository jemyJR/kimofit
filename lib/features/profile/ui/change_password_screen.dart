import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/profile/ui/profile_screen.dart';
import 'package:kimofit/features/profile/ui/widgets/change_password_form.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_container.dart';
import 'package:kimofit/generated/l10n.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).changePassword,
        elevation: 0,
        backgroundColor: ColorsManager.dark,
        scrolledUnderElevation: 0,
      ),
      body: appBarUnderLineFix(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileContainer(),
              verticalSpace(50),
              Text(
                S.of(context).changePasswordMessage,
                style: TextStyles.font18White,
              ),
              verticalSpace(10),
              const ChangePasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
