import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/app/logic/cubit/language_state.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.onSaved,
    this.validator,
  });
  final String hintText;

  final TextEditingController? controller;
  final void Function(PhoneNumber?)? onSaved;
  final String? Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return IntlPhoneField(
          initialCountryCode: 'EG',
          languageCode: state.locale.toString(),
          dropdownTextStyle: TextStyles.font18Gray,
          pickerDialogStyle: PickerDialogStyle(
            backgroundColor: ColorsManager.dark,
            countryCodeStyle: TextStyles.font15White,
            countryNameStyle: TextStyles.font15White,
            searchFieldCursorColor: ColorsManager.white,
            listTileDivider: const Divider(color: ColorsManager.gray),
            searchFieldInputDecoration: buildInputDecoration(
              context,
              S.of(context).searchCountry,
            ).copyWith(
              fillColor: ColorsManager.white,
              suffixIcon: Icon(
                Icons.search,
                size: 25.sp,
              ),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyles.font18White,
          textAlign: TextAlign.justify,
          decoration: buildInputDecoration(context, hintText),
          controller: controller,
          onSaved: onSaved,
          validator: validator,
        );
      },
    );
  }
}

InputDecoration buildInputDecoration(BuildContext context, String hintText) {
  return InputDecoration(
    isDense: true,
    fillColor: ColorsManager.dark,
    filled: true,
    contentPadding: EdgeInsets.all(15.r),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: ColorsManager.blue),
    ),
    hintText: hintText,
    hintStyle: TextStyles.font18Gray,
  );
}
