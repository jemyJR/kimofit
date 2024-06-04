import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/core/widgets/custom_form_field.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/phone_form_field.dart';
import 'package:kimofit/features/login/logic/cubit/login_cubit.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:kimofit/core/helpers/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();

    return Form(
      key: loginCubit.loginFormKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          PhoneFormField(
            hintText: S.of(context).phone,
            validator: (value) => validatePhone(context, value),
            onSaved: (phone) => loginCubit.phone = phone!.completeNumber,
          ),
          verticalSpace(5),
          CustomFormField(
            hintText: S.of(context).password,
            obscureText: true,
            suffixIcon: true,
            validator: (value) => validatePassword(context, value),
            onSaved: (password) => loginCubit.password = password!,
          ),
          verticalSpace(15),
          CustomButton(
            text: S.of(context).login,
            textStyle: TextStyles.font18White,
            backgroundColor: ColorsManager.blue,
            onPressed: () {
              validateThenDoLogin(context, loginCubit);
            },
          ),
        ],
      ),
    );
  }
}

//TODO: Search for how to validate a phone number without using this if statement
//! will be changed later
void validateThenDoLogin(BuildContext context, LoginCubit loginCubit) async {
  bool formIsValid = loginCubit.loginFormKey.currentState!.validate();
  if (formIsValid) {
    loginCubit.loginFormKey.currentState!.save();
    bool isPhoneValid = loginCubit.phone.length > 4;
    if (isPhoneValid) {
      await loginCubit.login();
    } else {
      customSnackBar(
        context,
        S.of(context).validationEmptyField,
      );
    }
  }
}
