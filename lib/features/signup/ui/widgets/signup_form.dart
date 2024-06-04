import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/core/widgets/custom_form_field.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/phone_form_field.dart';
import 'package:kimofit/features/signup/logic/cubit/signup_cubit.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:kimofit/core/helpers/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit = context.read<SignupCubit>();

    return Form(
      key: signupCubit.signupFormKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          CustomFormField(
            hintText: S.of(context).name,
            keyboardType: TextInputType.text,
            validator: (value) => validateName(context, value),
            onSaved: (name) => signupCubit.name = name!,
          ),
          verticalSpace(10),
          PhoneFormField(
            hintText: S.of(context).phone,
            validator: (value) => validatePhone(context, value),
            onSaved: (phone) => signupCubit.phone = phone!.completeNumber,
          ),
          verticalSpace(5),
          CustomFormField(
            hintText: S.of(context).password,
            obscureText: true,
            suffixIcon: true,
            validator: (value) => validatePassword(context, value),
            onSaved: (password) => signupCubit.password = password!,
          ),
          verticalSpace(15),
          CustomButton(
            text: S.of(context).signup,
            textStyle: TextStyles.font18White,
            backgroundColor: ColorsManager.blue,
            onPressed: () {
              validateThenDoSignup(context, signupCubit);
            },
          ),
        ],
      ),
    );
  }
}

void validateThenDoSignup(BuildContext context, SignupCubit signupCubit) async {
  bool formIsValid = signupCubit.signupFormKey.currentState!.validate();
  bool isPhoneValid = signupCubit.phone.length > 4;
  bool isEgyPhone = signupCubit.phone.startsWith('+20');

  if (!formIsValid) {
    return;
  }

  // Save the form state
  signupCubit.signupFormKey.currentState!.save();

  // Check if the phone number is valid
  if (!isPhoneValid) {
    customSnackBar(context, S.of(context).validationPhoneEmptyField);
    return;
  }

  // Check if the phone number is an Egyptian phone number and validate it
  if (isEgyPhone && !validateEgyPhone(context, signupCubit.phone)) {
    customSnackBar(context, S.of(context).validationPhone);
    return;
  }

  // Attempt to Signup
  await signupCubit.signup();
}
