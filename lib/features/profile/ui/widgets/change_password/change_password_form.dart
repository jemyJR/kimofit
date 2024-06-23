import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/widgets/app_buttons.dart';
import 'package:kimofit/core/widgets/custom_form_field.dart';
import 'package:kimofit/features/profile/logic/profile_cubit.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:kimofit/core/helpers/validation.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = context.read<ProfileCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: Form(
        key: profileCubit.changePasswordFormKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            verticalSpace(5),
            CustomFormField(
              hintText: S.of(context).oldPassword,
              obscureText: true,
              suffixIcon: true,
              validator: (value) => validatePassword(context, value),
              controller: profileCubit.oldPasswordController,
            ),
            verticalSpace(15),
            CustomFormField(
              hintText: S.of(context).newPassword,
              obscureText: true,
              suffixIcon: true,
              validator: (value) => validatePassword(context, value),
              controller: profileCubit.newPasswordController,
            ),
            verticalSpace(30),
            getButtonType(context, ButtonType.changePasswordLogic),
          ],
        ),
      ),
    );
  }
}

void validateThenDoChangePassword(BuildContext context) {
  if (context
      .read<ProfileCubit>()
      .changePasswordFormKey
      .currentState!
      .validate()) {
    context.read<ProfileCubit>().changePassword();
  }
}
