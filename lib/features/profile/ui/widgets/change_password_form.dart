import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/widgets/app_buttons.dart';
import 'package:kimofit/core/widgets/custom_form_field.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:kimofit/core/helpers/validation.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            verticalSpace(5),
            CustomFormField(
              hintText: S.of(context).oldPassword,
              obscureText: true,
              suffixIcon: true,
              validator: (value) => validatePassword(context, value),
              onSaved: (password) {},
            ),
            verticalSpace(15),
            CustomFormField(
              hintText: S.of(context).newPassword,
              obscureText: true,
              suffixIcon: true,
              validator: (value) => validatePassword(context, value),
              onSaved: (password) {},
            ),
            verticalSpace(30),
            getButtonType(context, ButtonType.changePasswordLogic),
          ],
        ),
      ),
    );
  }
}
