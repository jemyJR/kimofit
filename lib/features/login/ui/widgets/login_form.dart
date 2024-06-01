import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/core/widgets/custom_form_field.dart';
import 'package:kimofit/core/widgets/phone_form_field.dart';
import 'package:kimofit/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          PhoneFormField(
            hintText: S.of(context).phone,
          ),
          verticalSpace(5),
          CustomFormField(
            hintText: S.of(context).password,
            obscureText: true,
            suffixIcon: true,
          ),
          verticalSpace(15),
          CustomButton(
            text: S.of(context).login,
            textStyle: TextStyles.font18White,
            backgroundColor: ColorsManager.blue,
            onPressed: () => context.pushNamed(Routes.homeScreen),
          ),
        ],
      ),
    );
  }
}
